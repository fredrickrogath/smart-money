import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:smartmoney/pages2/entry.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  final String budgetId;
  const Category({Key? key, required this.budgetId}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();

  // TextEditingController amountIncome = TextEditingController();
  // TextEditingController amountExpense = TextEditingController();
  String accessToken = '';
  var incomeCategories = [];
  var expenseCategories = [];
  bool isLoading = false;

  double frameHeight = 0;
  double frameWidth = 0;

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  void getExpense(token) async {
    var url = Uri.http(
      domain,
      '/api/getExpense',
      // {
      //   'name': name.text,
      // },
    );

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      expenseCategories = jsonDecode(response.body)['data'];
      print(expenseCategories);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    setState(() {});
  }

  void getIncome(token) async {
    var url = Uri.http(
      domain,
      '/api/getIncome',
    );

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      incomeCategories = jsonDecode(response.body)['data'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  void addCategory(token, type) async {
    print(token);
    var url = Uri.http(
      domain,
      '/api/addCategory',
      {
        'name': name.text,
        'amount': amount.text,
        'type': type,
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
      name.text = '';
      amount.text = '';
      print(jsonDecode(response.body));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    refresh();
  }

  void deleteCategory(token, id) async {
    var url = Uri.http(domain, '/api/deleteCategory', {
      'id': id.toString(),
    });

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    refresh();
  }

  void selectCategory(token, id) async {
    var url = Uri.http(domain, '/api/selectCategory', {
      'categoryId': id.toString(),
    });

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    refresh();
  }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      getIncome(accessToken);
      getExpense(accessToken);
    });
    print(accessToken);
  }

  @override
  void initState() {
    // print(accessToken);
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    frameWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: frameHeight / 13,
          backgroundColor: const Color(0xFF0096C7),
          automaticallyImplyLeading: false,
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 10.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         Navigator.pop(context);
          //       });
          //     },
          //     child: const CircleAvatar(
          //       radius: 30.0,
          //       // backgroundColor: Color(0xFF8B5E34),
          //       child: Icon(
          //         CupertinoIcons.chevron_back,
          //         color: Colors.white,
          //         // size: 20.0,
          //       ),
          //     ),
          //   ),
          // ),
          title: Column(
            children: const [
              // Text('Category', style: TextStyle(fontSize: 23.0)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Add new category',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 20.0,
                  width: frameWidth / 1.1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Disposable Income ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // background: Paint()
                                //   ..color =
                                //       const Color.fromARGB(255, 118, 192, 121)
                                //   ..strokeWidth = 20
                                //   ..strokeJoin = StrokeJoin.round
                                //   ..strokeCap = StrokeCap.round
                                //   ..style = PaintingStyle.stroke,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),
                        FloatingActionButton(
                          heroTag: null,
                          elevation: 0.0,
                          onPressed: () {
                            var alertStyle = AlertStyle(
                              // animationType: AnimationType.grow,
                              // isCloseButton: false,
                              isButtonVisible: false,
                              isOverlayTapDismiss: false,
                              descStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              // descTextAlign: TextAlign.center,
                              animationDuration:
                                  const Duration(milliseconds: 000),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              // titleStyle: TextStyle(
                              //   color: const Color(0xFF24564F),
                              // ),
                              alertAlignment: Alignment.center,
                            );
                            Alert(
                              context: context,
                              style: alertStyle,
                              // type: AlertType.warning,
                              // title: "Select Scan Type",
                              content: Column(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      child: Flex(
                                          direction: Axis.vertical,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: TextField(
                                                controller: name,
                                                // obscureText: true,
                                                // obscuringCharacter: '*',
                                                // keyboardType: TextInputType.number,
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                decoration:
                                                    const InputDecoration(
                                                  suffixIcon: Icon(Icons.edit),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF8B5E34),
                                                        width: 2.0),
                                                  ),
                                                  // enabledBorder: OutlineInputBorder(
                                                  //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                                  // ),
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText: 'Category name',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30.0),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: TextField(
                                                controller: amount,
                                                // obscureText: true,
                                                // obscuringCharacter: '*',
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                decoration:
                                                    const InputDecoration(
                                                  suffixIcon: Icon(Icons.edit),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF8B5E34),
                                                        width: 2.0),
                                                  ),
                                                  // enabledBorder: OutlineInputBorder(
                                                  //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                                  // ),
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText: 'Category amount',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30.0),
                                            SizedBox(
                                                width: double.infinity,
                                                child: FloatingActionButton
                                                    .extended(
                                                  heroTag: null,
                                                  elevation: 0.0,
                                                  onPressed: () {
                                                    addCategory(
                                                        accessToken, 'income');

                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  },
                                                  label: const Text('Save'),
                                                ))
                                          ]))
                                ],
                              ),
                            ).show();
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 118, 192, 121),
                          child: const Icon(Icons.add),
                        ),
                      ])),
            ),
            SizedBox(
              height: frameHeight / 4.2,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: incomeCategories.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onLongPress: () {
                      var alertStyle = AlertStyle(
                        // animationType: AnimationType.grow,
                        // isCloseButton: false,
                        isButtonVisible: false,
                        isOverlayTapDismiss: false,
                        descStyle: const TextStyle(fontWeight: FontWeight.bold),
                        // descTextAlign: TextAlign.center,
                        animationDuration: const Duration(milliseconds: 000),
                        alertBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        // titleStyle: TextStyle(
                        //   color: const Color(0xFF24564F),
                        // ),
                        alertAlignment: Alignment.center,
                      );
                      Alert(
                        context: context,
                        style: alertStyle,
                        type: AlertType.warning,
                        // title: "Select Scan Type",
                        content: Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text('Confirm delete'),
                                      ),
                                      const SizedBox(height: 20.0),
                                      SizedBox(
                                          width: double.infinity,
                                          child: FloatingActionButton.extended(
                                            heroTag: null,
                                            elevation: 0.0,
                                            onPressed: () {
                                              deleteCategory(accessToken,
                                                  incomeCategories[i]['id']);

                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                            label: const Text('Delete'),
                                          ))
                                    ]))
                          ],
                        ),
                      ).show();
                    },
                    child: SizedBox(
                      height: 75.0,
                      child: Card(
                        elevation: 2,
                        shape: const Border(
                            left: BorderSide(color: Colors.green, width: 5)),
                        child: ListTile(
                          leading: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              primary: const Color.fromARGB(
                                  255, 121, 201, 124), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              selectCategory(
                                  accessToken, incomeCategories[i]['id']);
                            },
                            child: const Text('Add'),
                          ),
                          title: Text('${incomeCategories[i]['name']}'),
                          subtitle: Text(
                              "Current Tsh ${incomeCategories[i]['amount']}"),
                          trailing: const Text('Income',
                              style: TextStyle(color: Colors.green)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 20.0,
                  width: frameWidth / 1.1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //     child: Text('Disposable income ',
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //             background: Paint()
                        //               ..color =
                        //                   const Color.fromARGB(255, 118, 192, 121)
                        //               ..strokeWidth = 20
                        //               ..strokeJoin = StrokeJoin.round
                        //               ..strokeCap = StrokeCap.round
                        //               ..style = PaintingStyle.stroke,
                        //             color: Colors.white,
                        //             fontSize: 16.0))),

                        const Text('Budget Expenses ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // background: Paint()
                                //   ..color =
                                //       const Color.fromARGB(255, 118, 192, 121)
                                //   ..strokeWidth = 20
                                //   ..strokeJoin = StrokeJoin.round
                                //   ..strokeCap = StrokeCap.round
                                //   ..style = PaintingStyle.stroke,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),
                        FloatingActionButton(
                          heroTag: null,
                          elevation: 0.0,
                          onPressed: () {
                            var alertStyle = AlertStyle(
                              // animationType: AnimationType.grow,
                              // isCloseButton: false,
                              isButtonVisible: false,
                              isOverlayTapDismiss: false,
                              descStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              // descTextAlign: TextAlign.center,
                              animationDuration:
                                  const Duration(milliseconds: 000),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              // titleStyle: TextStyle(
                              //   color: const Color(0xFF24564F),
                              // ),
                              alertAlignment: Alignment.center,
                            );
                            Alert(
                              context: context,
                              style: alertStyle,
                              // type: AlertType.warning,
                              // title: "Select Scan Type",
                              content: Column(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      child: Flex(
                                          direction: Axis.vertical,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: TextField(
                                                controller: name,
                                                // obscureText: true,
                                                // obscuringCharacter: '*',
                                                // keyboardType: TextInputType.number,
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                decoration:
                                                    const InputDecoration(
                                                  suffixIcon: Icon(Icons.edit),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF8B5E34),
                                                        width: 2.0),
                                                  ),
                                                  // enabledBorder: OutlineInputBorder(
                                                  //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                                  // ),
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText: 'Category name',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30.0),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: TextField(
                                                controller: amount,
                                                // obscureText: true,
                                                // obscuringCharacter: '*',
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                decoration:
                                                    const InputDecoration(
                                                  suffixIcon: Icon(Icons.edit),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF8B5E34),
                                                        width: 2.0),
                                                  ),
                                                  // enabledBorder: OutlineInputBorder(
                                                  //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                                  // ),
                                                  border:
                                                      UnderlineInputBorder(),
                                                  hintText: 'Category amount',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30.0),
                                            SizedBox(
                                                width: double.infinity,
                                                child: FloatingActionButton
                                                    .extended(
                                                  elevation: 0.0,
                                                  onPressed: () {
                                                    addCategory(
                                                        accessToken, 'expense');

                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  },
                                                  label: const Text('Save'),
                                                ))
                                          ]))
                                ],
                              ),
                            ).show();
                          },
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.add),
                        ),
                      ])),
            ),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: expenseCategories.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onLongPress: () {
                      var alertStyle = AlertStyle(
                        // animationType: AnimationType.grow,
                        // isCloseButton: false,
                        isButtonVisible: false,
                        isOverlayTapDismiss: false,
                        descStyle: const TextStyle(fontWeight: FontWeight.bold),
                        // descTextAlign: TextAlign.center,
                        animationDuration: const Duration(milliseconds: 000),
                        alertBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        // titleStyle: TextStyle(
                        //   color: const Color(0xFF24564F),
                        // ),
                        alertAlignment: Alignment.center,
                      );
                      Alert(
                        context: context,
                        style: alertStyle,
                        type: AlertType.warning,
                        // title: "Select Scan Type",
                        content: Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text('Confirm delete'),
                                      ),
                                      const SizedBox(height: 20.0),
                                      SizedBox(
                                          width: double.infinity,
                                          child: FloatingActionButton.extended(
                                            elevation: 0.0,
                                            onPressed: () {
                                              deleteCategory(accessToken,
                                                  expenseCategories[i]['id']);

                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                            label: const Text('Delete'),
                                          ))
                                    ]))
                          ],
                        ),
                      ).show();
                    },
                    child: SizedBox(
                      height: 75.0,
                      child: Card(
                        elevation: 2,
                        shape: const Border(
                            left: BorderSide(color: Colors.blue, width: 5)),
                        child: ListTile(
                          leading: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              primary: const Color.fromARGB(
                                  255, 78, 162, 226), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              selectCategory(
                                  accessToken, expenseCategories[i]['id']);
                            },
                            child: const Text('Add'),
                          ),
                          title: Text('${expenseCategories[i]['name']}'),
                          subtitle: Text(
                              "Current Tsh ${expenseCategories[i]['amount']}"),
                          trailing: const Text('Expense',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 70.0,
              width: double.infinity,
              child: Container(
                  color: Colors.white,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         Row(
                    //           children: const [
                    //             Text('added income : ',
                    //                 style: TextStyle(
                    //                   fontSize: 16.0,
                    //                 )),
                    //             Text('0',
                    //                 style: TextStyle(
                    //                     fontSize: 16.0,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.green)),
                    //           ],
                    //         ),
                    //         Row(
                    //           children: const [
                    //             Text('added expenses category : ',
                    //                 style: TextStyle(
                    //                   fontSize: 16.0,
                    //                 )),
                    //             Text('0',
                    //                 style: TextStyle(
                    //                     fontSize: 16.0,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.blue)),
                    //           ],
                    //         )
                    //       ]),
                    // ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: 370.0,
                          height: 40.0,
                          child: ElevatedButton(
                            // style: raisedButtonStyle,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              FocusManager.instance.primaryFocus?.unfocus();
                              await Future.delayed(const Duration(seconds: 1));

                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      reverseDuration:
                                          const Duration(milliseconds: 700),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const Entry()));
                            },
                            child: isLoading
                                ? Center(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  )
                                : const Text(
                                    'Done',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        )
                        // SizedBox(
                        //   height: frameHeight / 15,
                        //   child: FloatingActionButton.extended(
                        //     heroTag: null,
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           PageTransition(
                        //               duration: const Duration(milliseconds: 700),
                        //               reverseDuration:
                        //                   const Duration(milliseconds: 700),
                        //               type:
                        //                   PageTransitionType.rightToLeftWithFade,
                        //               child: const Entry()));
                        //     },
                        //     label: const Text('Done'),
                        //     icon: const Icon(Icons.forward),
                        //     backgroundColor: const Color(0xFF0096C7),
                        //   ),
                        // ),
                        ),
                  ])),
            )
          ],
        ),
      )),
    );
  }
}
