import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:smartmoney/pages2/category.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();
  TextEditingController name = TextEditingController();

  double frameHeight = 0;
  double frameWidth = 0;
  String accessToken = '';
  bool proceed = false;

  void createBudget(token) async {
    var url = Uri.http(
      domain,
      '/api/createBudget',
      {
        'name': name.text,
        'start_date': dateStart.text,
        'end_date': dateEnd.text
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
      proceed = true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('isLogin', true);
    return prefs.getString('access_token');
  }

//   getStringValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return String
//   String stringValue = prefs.getString('access_token');
//   return stringValue;
// }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: frameHeight / 10,
            backgroundColor: const Color(0xFF0096C7),
            title: Column(
              children: const [
                Text('New budget',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
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
                  SizedBox(
                    // width: MediaQuery.of(context).size.width / 1.3,
                    // height: MediaQuery.of(context).size.height / 17,
                    child: TextField(
                      controller: name,
                      // obscureText: true,
                      // obscuringCharacter: '*',
                      // keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16.0),
                      decoration: const InputDecoration(
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
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            getToken().then((value) {
                              createBudget(value);
                            });

                            if (proceed) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      reverseDuration:
                                          const Duration(milliseconds: 700),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const Category()));
                            }
                          },
                          label: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
