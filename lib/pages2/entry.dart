
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            // centerTitle: true,
            toolbarHeight: 100,
            backgroundColor: const Color(0xFF6F4518),
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: Color(0xFF8B5E34),
                child: Icon(
                  CupertinoIcons.book_fill,
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
                SizedBox(width: double.infinity,
                  child: Card(
                    elevation: 2.5,
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0),
                          child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Net balance',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 117, 117, 117),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 117, 117, 117),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFFBC8A5F),
                        thickness: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Total in ( + )',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold)),
                                  Text('0',
                                      style: TextStyle(
                                          color: Color(0xFF337A6F),
                                          fontSize: 17.0,
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
                            padding: const EdgeInsets.symmetric(horizontal:20.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Total out ( - )',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
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
                // SizedBox(height: MediaQuery.of(context).size.height / 40),
                SizedBox(height: MediaQuery.of(context).size.height / 23),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Card(
                    elevation: 2.5,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            CupertinoIcons.lock_circle_fill,
                            color: Colors.green,
                            size: 36.0,
                          ),
                          Text('Only you can see these entries',
                              style: TextStyle(
                                color: Color.fromARGB(255, 117, 117, 117),
                                fontSize: 15.0,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 30),

                const Text('Try add your first Entry',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 117, 117, 117),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),

                SizedBox(height: MediaQuery.of(context).size.height / 30),

                const Icon(
                  CupertinoIcons.arrow_down_circle_fill,
                  color: Colors.green,
                  size: 40.0,
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        Text('Record ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 117, 117, 117),
                              fontSize: 17.0,
                            )),
                        Text('Income',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 17.0,
                            ))
                      ],
                    ),
                    Row(
                      children: const [
                        Text('Record ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 117, 117, 117),
                              fontSize: 17.0,
                            )),
                        Text('Expense',
                            style: TextStyle(
                              color: Color(0xffDB575B),
                              fontSize: 17.0,
                            ))
                      ],
                    )
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 30),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text('Cash In'),
                        icon: const Icon(Icons.add),
                        backgroundColor: Colors.green,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text('Cash Out'),
                        icon: const Icon(Icons.remove),
                        backgroundColor: Colors.red,
                      ),
                    ])
              ],
            ),
          )),
    );
  }
}
