import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartmoney/pages2/category.dart';
import 'package:intl/intl.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  @override
  void initState() {
    dateStart.text = ""; //set the initial value of text field
    dateEnd.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: MediaQuery.of(context).size.height / 7.0,
            backgroundColor: const Color(0xFF6F4518),
            title: Column(
              children: const [
                Text('New budget', style: TextStyle(fontSize: 25.0)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Create your new budget',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400)),
                )
              ],
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
                  SizedBox(height: MediaQuery.of(context).size.height / 40),

                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 10.0),
                  //   child: Text('Start date',
                  //       style: TextStyle(
                  //           fontSize: 16.0,
                  //           fontWeight: FontWeight.w600,
                  //           color: Color(0xFF8B5E34))),
                  // ),

                  // SizedBox(
                  //   height: 200,
                  //   child: CupertinoTheme(
                  //     data: const CupertinoThemeData(
                  //       textTheme: CupertinoTextThemeData(
                  //         dateTimePickerTextStyle:
                  //             TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //     child: CupertinoDatePicker(
                  //       backgroundColor: const Color(0xFF8B5E34),
                  //       mode: CupertinoDatePickerMode.dateAndTime,
                  //       initialDateTime: DateTime(1969, 1, 1, 11, 33),
                  //       onDateTimeChanged: (DateTime newDateTime) {
                  //         //Do Some thing
                  //       },
                  //       use24hFormat: false,
                  //       minuteInterval: 1,
                  //     ),
                  //   ),
                  // ),

                  Center(
                      child: TextField(style:TextStyle(fontSize:18.0),
                    controller:
                        dateStart, //editing controller of this TextField
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Start Date" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateStart.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  )),


                  SizedBox(height: MediaQuery.of(context).size.height / 25),

                  // const Padding(
                  //   padding: EdgeInsets.only(bottom: 8.0, top: 10.0),
                  //   child: Text('End date',
                  //       style: TextStyle(
                  //           fontSize: 16.0,
                  //           fontWeight: FontWeight.w600,
                  //           color: Color(0xFF8B5E34))),
                  // ),

                  // SizedBox(
                  //   height: 200,
                  //   child: CupertinoTheme(
                  //     data: const CupertinoThemeData(
                  //       textTheme: CupertinoTextThemeData(
                  //         dateTimePickerTextStyle:
                  //             TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //     child: CupertinoDatePicker(
                  //       backgroundColor: const Color(0xFF8B5E34),
                  //       mode: CupertinoDatePickerMode.dateAndTime,
                  //       initialDateTime: DateTime(1969, 1, 1, 11, 33),
                  //       onDateTimeChanged: (DateTime newDateTime) {
                  //         //Do Some thing
                  //       },
                  //       use24hFormat: false,
                  //       minuteInterval: 1,
                  //     ),
                  //   ),
                  // ),


                  Center(
                      child: TextField(style:TextStyle(fontSize:18.0),
                    controller:
                        dateEnd, //editing controller of this TextField
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "End Date" //label text of field
                        ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateEnd.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  )),

                  SizedBox(height: MediaQuery.of(context).size.height / 20),

                  SizedBox(width: MediaQuery.of(context).size.width/1.3,height:MediaQuery.of(context).size.height / 17,
                    child: const TextField(
                      // obscureText: true,
                      // obscuringCharacter: '*',
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize:18.0),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF8B5E34), width: 2.0),
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                        // ),
                        border: UnderlineInputBorder(),
                        hintText: 'Budget name',
                      ),
                    ),
                  ),
                  //                 TextButton(
                  //   style: TextButton.styleFrom(
                  //     primary: Colors.blue,
                  //   ),
                  //   onPressed: () { },
                  //   child: Text('TextButton'),
                  // ),
                  // RaisedButton(
                  //   color: Colors.red, // background
                  //   textColor: Colors.white, // foreground
                  //   onPressed: () { },
                  //   child: Text('RaisedButton with custom foreground/background'),
                  // )
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.height / 2.0,
                  //   height: MediaQuery.of(context).size.height / 18.0,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: const Color(0xFF6F4518), // background
                  //       onPrimary: Colors.white, // foreground
                  //     ),
                  //     onPressed: () {},
                  //     child: const Text(
                  //       'Next',
                  //       style: TextStyle(fontSize: 18.0),
                  //     ),
                  //   ),
                  // ),

                  OpenContainer(
                    closedColor: const Color(0xFF6F4518),
                    openColor: const Color(0xFF6F4518),
                    closedElevation: 0.0,
                    openElevation: 0.0,
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 1000),
                    openBuilder: (context, action) {
                      return const Category();
                    },
                    closedBuilder: (context, action) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                // ignore: unrelated_type_equality_checks
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
