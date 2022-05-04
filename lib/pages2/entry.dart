import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartmoney/app_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:smartmoney/pages2/in_entry.dart';
import 'package:smartmoney/pages2/out_entry.dart';

class Entry extends StatefulWidget {
  final String budgetId;
  const Entry({Key? key, required this.budgetId}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  double frameHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.budgetId);
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
              SizedBox(height: MediaQuery.of(context).size.height / 35),
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
                            children: const [
                              Text(
                                'Net balance',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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
                              children: const [
                                Text('Total in ( + )',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 117, 117, 117),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                Text('0',
                                    style: TextStyle(
                                        color: Color(0xFF337A6F),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))
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
                              children: const [
                                Text('Total out ( - )',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 117, 117, 117),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold)),
                                Text('0',
                                    style: TextStyle(
                                        color: Color(0xffDB575B),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height / 30),

              SizedBox(
                height: 200.0,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text("List item $index"));
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

              // SizedBox(height: MediaQuery.of(context).size.height / 30),
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
                  height: frameHeight / 15,
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
                              child: const InEntry()));
                    },
                    label: const Text('Cash In'),
                    icon: const Icon(Icons.add),
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: frameHeight / 15,
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
                              child: const outEntry()));
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
