import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/categoryLists.dart';
import 'package:smartmoney/domain/domain.dart';

class InEntry extends StatefulWidget {
  const InEntry({Key? key}) : super(key: key);

  @override
  State<InEntry> createState() => _InEntryState();
}

class _InEntryState extends State<InEntry> {
  final _controller = TextEditingController();

  double frameHeight = 0;
  double frameWidth = 0;

  var accessToken;

  var categoryId;

  var categoryName;

  bool categoryIsSet = false;

  var budgetId;

  final _formKey = GlobalKey<FormState>();

  String? selectedValue;

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryLists()),
    );
    categoryId = result[1];

    categoryName = result[0];

    categoryIsSet = true;

    setState(() {
      
    });
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  getBudgetId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('budgetId');
  }

  void addEntry(token) async {
    var url = Uri.http(
      domain,
      '/api/addEntry',
      {
        'amount': _controller.text,
        'type': 'in',
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
      // categories = jsonDecode(response.body)['data'];
      var res = json.decode(response.body);
      // categories.cast<String>();
      // categoryLIst = Map<String, dynamic>.from(json.decode(response.body))['data'].cast<String>();
      print(res);
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cash In Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 30),
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
                    horizontal: 10.0, vertical: 20.0),
                child: SizedBox(
                  height: frameHeight / 17.0,
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    elevation: 0.0,
                    onPressed: () {
                      _navigateAndDisplaySelection(context);
                    },
                    label: Text(
                      categoryIsSet ? '$categoryName' : 'Select category',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    // icon: const Icon(Icons.remove),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height / 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: SizedBox(
                  height: frameHeight / 17.0,
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    elevation: 0.0,
                    onPressed: () {
                      setState(() {});
                     
                      if (_controller.value.text.isNotEmpty) {
                         addEntry(accessToken);

                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         duration: const Duration(milliseconds: 700),
                        //         reverseDuration:
                        //             const Duration(milliseconds: 700),
                        //         type:
                        //             PageTransitionType.rightToLeftWithFade,
                        //         child: CategoryLists()));
                         Navigator.pop(context);
                      }
                    },
                    label: const Text('Save'),
                    // icon: const Icon(Icons.remove),
                    backgroundColor: const Color(0xFF0096C7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
