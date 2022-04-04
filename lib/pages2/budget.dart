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

  double frameHeight = 0;
  double frameWidth = 0;

  @override
  void initState() {
    dateStart.text = ""; //set the initial value of text field
    dateEnd.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: frameHeight / 10,
            backgroundColor: const Color(0xFF0096C7),
            title: Column(
              children: const [
                Text('New budget', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 10.0),
                //   child: Text('Create your new budget',
                //       style: TextStyle(
                //           fontSize: 17.0, fontWeight: FontWeight.w400)),
                // )
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
                      child: TextField(
                    style: const TextStyle(fontSize: 16.0),
                    controller:
                        dateStart, //editing controller of this TextField
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                        // icon: Icon(Icons.calendar_today), //icon of text field
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

                  SizedBox(height: MediaQuery.of(context).size.height / 30),

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
                      child: TextField(
                    style: const TextStyle(fontSize: 16.0),
                    controller: dateEnd, //editing controller of this TextField
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                        // icon: Icon(Icons.calendar_today), //icon of text field
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

                  SizedBox(height: MediaQuery.of(context).size.height / 30),

                  const SizedBox(
                    // width: MediaQuery.of(context).size.width / 1.3,
                    // height: MediaQuery.of(context).size.height / 17,
                    child: TextField(
                      // obscureText: true,
                      // obscuringCharacter: '*',
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.edit),
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
                    closedColor: Colors.white,
                    openColor: Colors.white,
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
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        width: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            
                            decoration: const BoxDecoration(
                              color: Color(0xFF0096C7),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0)),
      ),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  // ignore: unrelated_type_equality_checks
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )],);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
