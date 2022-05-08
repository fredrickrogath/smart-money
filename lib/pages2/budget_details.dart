import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:http/http.dart' as http;

class budgetDetails extends StatefulWidget {
  final String budgetId;
  final String budgetName;
  const budgetDetails(
      {Key? key, required this.budgetId, required this.budgetName})
      : super(key: key);

  @override
  State<budgetDetails> createState() => _budgetDetailsState();
}

class _budgetDetailsState extends State<budgetDetails> {
  double frameHeight = 0;

  var totalIn;

  var totalOut;

  bool noEntries = false;

  var entries = [];

  String accessToken = '';

  void totalInFn(token) async {
    var url = Uri.http(
      domain,
      '/api/totalIn',
      {
        'budget_id': widget.budgetId,
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
      totalIn == null ? totalIn = 0 : null;
      print('totalIn : $totalIn');
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
        'budget_id': widget.budgetId,
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
      totalOut == null ? totalOut = 0 : null;
      print('totalOut $totalOut');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  void getEntries(token) async {
    var url = Uri.http(
      domain,
      '/api/getEntries',
      {
        'budget_id': widget.budgetId,
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
      print(entries);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      print('token: ' + accessToken);

      totalInFn(accessToken);
      totalOutFn(accessToken);
      getEntries(accessToken);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print(widget.budgetId);
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    totalIn ??= 0.0000000001;
    if (totalIn == 0.0000000001) {
      setState(() {
        noEntries = true;
      });
    } else {
      setState(() {
        noEntries = false;
      });
    }
    totalOut ??= 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: frameHeight / 13,
        backgroundColor: const Color(0xFF0096C7),
        // automaticallyImplyLeading: false,
        title: Column(
          children: [
            Text(widget.budgetName,
                style: const TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      body: noEntries == false
          ? SingleChildScrollView(
              child: Column(children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       CircularPercentIndicator(
                //         animationDuration: 2000,
                //         animation: true,
                //         radius: 60.0,
                //         lineWidth: 8.0,
                //         percent: 0.9,
                //         center: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [Text("Saving"), Text("Tsh 4000")],
                //         ),
                //         progressColor: Colors.green,
                //       ),
                //       CircularPercentIndicator(
                //         animation: true,
                //         radius: 60.0,
                //         lineWidth: 8.0,
                //         percent: 0.08,
                //         center: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: const [Text("Budget Spent"), Text("8%")],
                //         ),
                //         progressColor: Colors.red,
                //       )
                //     ],
                //   ),
                // ),
                const SizedBox(height: 5.0,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height: 70,
                          width: 180,
                          child: Card(
                              elevation: 2.0,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Income spent'),
                                  Text(
                                      '${((totalOut / totalIn) * 100).ceil()}%')
                                ],
                              )))),
                      SizedBox(
                          height: 70,
                          width: 180,
                          child: Card(
                              elevation: 2.0,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Remainig to spent'),
                                  Text('Tsh ${totalIn - totalOut}')
                                ],
                              )))),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 70,
                        width: 180,
                        child: Card(
                            elevation: 2.0,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Total expenditure'),
                                Text('Tsh $totalOut')
                              ],
                            )))),
                    SizedBox(
                        height: 70,
                        width: 180,
                        child: Card(
                            elevation: 2.0,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('Total budgeted'),
                                Text('Tsh $totalIn')
                              ],
                            )))),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 15.0),
                //   child: SizedBox(
                //       height: 70,
                //       width: 300,
                //       child: Card(
                //           elevation: 2.0,
                //           child: Center(
                //               child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: const [
                //               Text('Net disposable income'),
                //               Text('Tsh 1,230,000')
                //             ],
                //           )))),
                // ),
                const SizedBox(height: 5.0,),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text('Net disposable income'),
                  subtitle: Text('Tsh $totalIn'),
                  controlAffinity: ListTileControlAffinity.leading,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: entries.length,
                            itemBuilder: (context, i) {
                              return entries[i]['type'] == 'in'
                                  ? ListTile(
                                      title:
                                          Text('${entries[i]['category_name']}',
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              )),
                                      subtitle: const Text('Income'),
                                      trailing:
                                          Text('Tsh ${entries[i]['amount']}'),
                                    )
                                  : const SizedBox(
                                      height: 0.0,
                                    );
                            }))
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text('Total expenditure'),
                  subtitle: Text('Tsh $totalOut'),
                  controlAffinity: ListTileControlAffinity.leading,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: entries.length,
                            itemBuilder: (context, i) {
                              return entries[i]['type'] == 'out'
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 6.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${entries[i]['category_name']}',
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                              ]),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: const [
                                                Text('Budget Spent',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text('Tsh 730,000'),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: const [
                                                Text('Budget Planned',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text('Tsh 730,000'),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: const [
                                                Text('Remaining',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text('Tsh 730,000'),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: LinearPercentIndicator(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    50,
                                                animation: true,
                                                lineHeight: 15.0,
                                                animationDuration: 2500,
                                                percent: 0.8,
                                                center: const Text("80.0%"),
                                                barRadius:
                                                    const Radius.elliptical(
                                                        30, 30),
                                                // linearStrokeCap: LinearStrokeCap.roundAll,
                                                progressColor: Colors.green,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 0.0,
                                    );
                            }))
                  ],
                ),
              ]),
            )
          : Center(
              child: Text(widget.budgetName + ' budget has no entries',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400)),
            ),
    );
  }
}
