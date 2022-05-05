import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/app_bar.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:smartmoney/pages2/in_entry.dart';
// import 'package:smartmoney/pages2/out_entry.dart';

import 'package:http/http.dart' as http;
import 'package:smartmoney/pages2/out_entry.dart';

class Entry extends StatefulWidget {
  final String budgetId;
  const Entry({Key? key, required this.budgetId}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  double frameHeight = 0;

  var accessToken;

  var budgetId;

  var balance;

  var totalIn;

  var totalOut;

  var entries = [];

  getFormatedDate(_date) {
    var str = _date;
    var newStr = str.substring(0, 10) + ' ' + str.substring(11, 23);
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(newStr);
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    return outputFormat.format(inputDate);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  getBudgetId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('budgetId');
  }

  void getEntries(token) async {
    var url = Uri.http(
      domain,
      '/api/getEntries',
      {
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
      entries = jsonDecode(response.body)['data'];

      balance = jsonDecode(response.body)['balance'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  void totalInFn(token) async {
    var url = Uri.http(
      domain,
      '/api/totalIn',
      {
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
      totalIn = jsonDecode(response.body)['data'];
      print(totalIn);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  void totalOutFn(token) async {
    var url = Uri.http(
      domain,
      '/api/totalOut',
      {
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
      totalOut = jsonDecode(response.body)['data'];
      print(totalOut);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      print('token: ' + accessToken);
      // getCategories(accessToken);
      // getExpense(accessToken);
    });
    getBudgetId().then((value) {
      budgetId = value;
      print('budget id is :' + budgetId);
    });

    getEntries(accessToken);
    totalInFn(accessToken);
    totalOutFn(accessToken);
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
    return SafeArea(
      child: Scaffold(
        endDrawer: const Drawer(child: appBarr()),
        appBar: AppBar(
          // centerTitle: true,
          toolbarHeight: frameHeight / 10,
          backgroundColor: const Color(0xFF0096C7),
          leading: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 30.0,
              // backgroundColor: Color(0xFF90E0EF),
              child: Icon(
                CupertinoIcons.bookmark_fill,
                color: Colors.white,
                size: 36.0,
              ),
            ),
          ),
          title: const Text('Add new book',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 0.7,
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Net balance',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '${(totalIn - totalOut)}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFF48CAE4),
                      thickness: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total in ( + )',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 117, 117, 117),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400)),
                                Text('$totalIn',
                                    style: const TextStyle(
                                        color: Color(0xFF337A6F),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total out ( - )',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 117, 117, 117),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400)),
                                Text('$totalOut',
                                    style: const TextStyle(
                                        color: Color(0xffDB575B),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 400.0,
                child: entries.isEmpty
                    ? Center(
                        child: Text(
                        'No entry added',
                        style: TextStyle(color: Colors.grey[700]),
                      ))
                    : ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        itemCount: entries.length,
                        itemBuilder: (BuildContext context, int index) {
                          // print(entries[index]['created_at']);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Card(
                              elevation: 2,
                              shape: Border(
                                  left: const BorderSide(
                                      color: Colors.blue, width: 5),
                                  right: BorderSide(
                                      color: entries[index]['type'] == 'in'
                                          ? Colors.green
                                          : Colors.red,
                                      width: 5)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              '${entries[index]['category_name']}'),
                                        ),
                                        // Text(
                                        //   getFormatedDate(
                                        //       '2021-05-27 9:34:12.781341'),
                                        // )
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(getFormatedDate(
                                              entries[index]['created_at'])),
                                        )
                                        // Text('${DateFormat('dd/MM/yyyy HH:mm').format(entries[index]['created_at'])})')
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                              '${entries[index]['amount']}'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              'Balance Tsh ${entries[index]['balance']}'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),

              // SizedBox(height: MediaQuery.of(context).size.height / 20),

              // const Text('Try add your first Entry',
              //     style: TextStyle(
              //         fontStyle: FontStyle.italic,
              //         color: Color.fromARGB(255, 117, 117, 117),
              //         fontSize: 16.0,
              //         fontWeight: FontWeight.bold)),

              // SizedBox(height: MediaQuery.of(context).size.height / 30),

              // const Icon(
              //   CupertinoIcons.arrow_down_circle_fill,
              //   color: Colors.green,
              //   size: 40.0,
              // ),

              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      Text('Record ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                            fontSize: 15.0,
                          )),
                      Text('Income',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.0,
                          ))
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Record ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                            fontSize: 15.0,
                          )),
                      Text('Expense',
                          style: TextStyle(
                            color: Color(0xffDB575B),
                            fontSize: 15.0,
                          ))
                    ],
                  )
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height / 60),

              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  height: frameHeight / 20,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    elevation: 0.0,
                    onPressed: () {
                      Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 400),
                                  reverseDuration:
                                      const Duration(milliseconds: 400),
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const InEntry()))
                          .whenComplete(refresh);
                    },
                    label: const Text('Cash In'),
                    icon: const Icon(Icons.add),
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: frameHeight / 20,
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    elevation: 0.0,
                    onPressed: () {
                      Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 400),
                                  reverseDuration:
                                      const Duration(milliseconds: 400),
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const outEntry()))
                          .whenComplete(refresh);
                    },
                    label: const Text('Cash Out'),
                    icon: const Icon(Icons.remove),
                    backgroundColor: Colors.red,
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
