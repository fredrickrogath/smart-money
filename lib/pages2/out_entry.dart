import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/categoryLists.dart';
import 'package:smartmoney/domain/domain.dart';

class outEntry extends StatefulWidget {
  const outEntry({Key? key}) : super(key: key);

  @override
  State<outEntry> createState() => _outEntryState();
}

class _outEntryState extends State<outEntry> {
  final _controller = TextEditingController();

  double frameHeight = 0;
  double frameWidth = 0;

  var accessToken;

  var categoryId;

  var categoryName;

  bool categoryIsSet = false;

  var budgetId;

  bool isLoading = false;

  // final _formKey = GlobalKey<FormState>();

  String? selectedValue;

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryLists()),
    );
    categoryId = result[1];

    categoryName = result[0];

    categoryIsSet = true;

    setState(() {});
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  getBudgetId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('budgetId');
  }

  wait() async {
    return await Future.delayed(const Duration(seconds: 10));
  }

  void addEntry(token) async {
    var url = Uri.http(
      domain,
      '/api/addEntry',
      {
        'amount': _controller.text,
        'type': 'out',
        'category_id': categoryId,
        'category_name': categoryName,
        'budget_id': budgetId,
      },
    );

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
    } else {
      print('Request failed with status: ${response.request}.');
    }

    setState(() {});
  }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      // getCategories(accessToken);
      // getExpense(accessToken);
    });
    getBudgetId().then((value) {
      budgetId = value;
      print('budget id is :' + budgetId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    frameWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Cash Out Entry'),
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              await Future.delayed(const Duration(seconds: 1));
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF0096C7), width: 2.0),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                      // ),
                      border: UnderlineInputBorder(),
                      hintText: 'Amount',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      _navigateAndDisplaySelection(context);
                    },
                    child: SizedBox(
                        height: frameHeight / 17.0,
                        width: double.infinity,
                        child: Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       categoryIsSet
                            //           ? '$categoryName'
                            //           : 'Select category',
                            //       style: TextStyle(
                            //           color: Colors.grey[700],
                            //           fontSize: 15.3,
                            //           fontWeight: FontWeight.w400),
                            //     )
                            //   ],
                            // ),
                            Row(
                              children: [
                                Container(
                                  width: 350.0,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      categoryIsSet
                                          ? '$categoryName'
                                          : 'Select category',
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15.3,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromARGB(
                                              255, 223, 223, 223)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                        // FloatingActionButton.extended(
                        //   heroTag: null,
                        //   elevation: 0.0,
                        //   onPressed: () {
                        //     _navigateAndDisplaySelection(context);
                        //   },
                        //   label: Text(
                        //     categoryIsSet ? '$categoryName' : 'Select category',
                        //     style: TextStyle(color: Colors.grey[700]),
                        //   ),
                        //   // icon: const Icon(Icons.remove),
                        //   backgroundColor: Colors.white,
                        // ),
                        ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 10.0, vertical: 20.0),
                //   child: SizedBox(
                //     height: frameHeight / 17.0,
                //     width: double.infinity,
                //     child: FloatingActionButton.extended(
                //       heroTag: null,
                //       elevation: 0.0,
                //       onPressed: () {
                //         _navigateAndDisplaySelection(context);
                //       },
                //       label: Text(
                //         categoryIsSet ? '$categoryName' : 'Select category',
                //         style: TextStyle(color: Colors.grey[700]),
                //       ),
                //       // icon: const Icon(Icons.remove),
                //       backgroundColor: Colors.white,
                //     ),
                //   ),
                // ),
                // SizedBox(height: MediaQuery.of(context).size.height / 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: SizedBox(
                    height: frameHeight / 20.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      // style: raisedButtonStyle,
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (_controller.value.text.isNotEmpty) {
                          addEntry(accessToken);
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pop(context);
                      },
                      child: isLoading
                          ? Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          : const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                    ),

                    // FloatingActionButton.extended(
                    //   heroTag: null,
                    //   elevation: 0.0,
                    //   onPressed: () async {
                    //     setState(() {});
                    //     FocusManager.instance.primaryFocus?.unfocus();

                    //     if (_controller.value.text.isNotEmpty) {
                    //       addEntry(accessToken);
                    //     }

                    //     await Future.delayed(const Duration(seconds: 1));
                    //     Navigator.pop(context);
                    //   },
                    //   label: const Text('Save'),
                    //   // icon: const Icon(Icons.remove),
                    //   backgroundColor: const Color(0xFF0096C7),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
