import 'package:animations/animations.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Estimator extends StatefulWidget {
  const Estimator({Key? key}) : super(key: key);

  @override
  State<Estimator> createState() => _EstimatorState();
}

class _EstimatorState extends State<Estimator> {
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  bool isChecked = false;

  double frameHeight = 0;
  double frameWidth = 0;

  @override
  Widget build(BuildContext context) {

    frameHeight = MediaQuery.of(context).size.height;
    frameWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: frameHeight / 10,
              // backgroundColor: const Color(0xFF6F4518),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 30.0,
                    // backgroundColor: Color(0xFF8B5E34),
                    child: Icon(
                      CupertinoIcons.chevron_back,
                      color: Colors.white,
                      // size: 20.0,
                    ),
                  ),
                ),
              ),
              title: const Text('Budget Estimator', style:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.0,
                            height: MediaQuery.of(context).size.height / 17,
                            child: const TextField(
                              // obscureText: true,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0096C7), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Enter your income',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 17,
                            child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              // popupBackgroundColor: Colors.yellow,
                              
                              popupBarrierColor: const Color(0xFF0096C7),
                              showSelectedItems: true,
                              items: const [
                                "Formular 1",
                                "Formular 2",
                                "Formular 3",
                                'Formular 4',
                                "Formular 5",
                              ],
                              label: "Select Formular",
                              // hint: "country in menu mode",
                              // popupItemDisabled: (String s) =>
                              //     s.startsWith('I'),
                              onChanged: print,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("Expenses",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0)),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.grey),
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                              ),
                              Container(
                                child: const Text("Savings",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0)),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.grey),
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Text("Zaka / Sadaka",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0)),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.grey),
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                              ),
                              Container(
                                child: const Text("Loans.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0)),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.grey),
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 10.0, 10.0, 10.0),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                                child: FloatingActionButton.extended(
                                  onPressed: () {},
                                  label: const Text('Calculate'),
                                  // icon: const Icon(Icons.forward),
                                  backgroundColor: const Color(0xFF0096C7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.0,
                            height: MediaQuery.of(context).size.height / 20,
                            child: const TextField(
                              // obscureText: true,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0096C7), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF0096C7), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Total',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.0,
                            height: MediaQuery.of(context).size.height / 20,
                            child: const TextField(
                              // obscureText: true,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0096C7), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Expenses',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.0,
                            height: MediaQuery.of(context).size.height / 20,
                            child: const TextField(
                              // obscureText: true,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0096C7), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF0096C7), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Savings',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.0,
                            height: MediaQuery.of(context).size.height / 20,
                            child: const TextField(
                              // obscureText: true,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0096C7), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Loans',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.0,
                            height: MediaQuery.of(context).size.height / 20,
                            child: const TextField(
                              // obscureText: true,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 16.0),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF0096C7), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Zaka',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: const Text('pdf'),
                          icon: const Icon(Icons.download),
                          backgroundColor: const Color(0xFF0096C7),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
