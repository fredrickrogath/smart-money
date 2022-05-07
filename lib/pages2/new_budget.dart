// import 'dart:convert';

// import 'package:animations/animations.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:smartmoney/pages2/budget_details.dart';
import 'package:smartmoney/pages2/category.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class NewBudget extends StatefulWidget {
  const NewBudget({Key? key}) : super(key: key);

  @override
  State<NewBudget> createState() => _NewBudgetState();
}

class _NewBudgetState extends State<NewBudget> {
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();
  TextEditingController name = TextEditingController();

  double frameHeight = 0;
  double frameWidth = 0;
  String accessToken = '';
  bool proceed = false;
  String budgetId = '';
  bool hideForm = true;
  var budgets = [];

  getFormatedDate(_date) {
    var str = _date;
    var newStr = str.substring(0, 10) + ' ' + str.substring(11, 23);
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(newStr);
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    return outputFormat.format(inputDate);
  }

  void createBudget(token) async {
    var url = Uri.http(
      domain,
      '/api/createNewBudget',
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
      var res = jsonDecode(response.body);
      proceed = true;
      budgetId = res['budget_id'].toString();
      print('budget id is :' + budgetId);
      saveBudgetId(budgetId);

      name.text = '';
      dateStart.text = '';
      dateEnd.text = '';
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void budgetList(token) async {
    var url = Uri.http(
      domain,
      '/api/budgetList',
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
      budgets = jsonDecode(response.body)['data'];
      print(budgets);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  saveBudgetId(budgetId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('budgetId', budgetId);
  }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      print('token: ' + accessToken);
      // getCategories(accessToken);
      // getExpense(accessToken);
    });

    createBudget(accessToken);
    budgetList(accessToken);

    setState(() {
      
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

    return SafeArea(
        child: hideForm
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  centerTitle: true,
                  toolbarHeight: frameHeight / 13,
                  backgroundColor: const Color(0xFF0096C7),
                  // automaticallyImplyLeading: false,
                  title: Column(
                    children: const [
                      Text('My budgets',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            // hideForm = false;
                            refresh();
                            setState(() {});
                          },
                          icon: const Icon(
                            CupertinoIcons.add,
                            // color: Colors.white,
                            // size: 36.0,
                          ),
                        )),
                  ],
                ),
                body: Column(
                  children: [
                   const SizedBox(height: 5.0,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics()),
                          itemCount: budgets.length,
                          itemBuilder: (context, i) {
                            return OpenContainer(
                              closedElevation: 0.0,
                              openElevation: 0.0,
                              closedShape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              transitionType: ContainerTransitionType.fade,
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              openBuilder: (context, action) {
                                return const budgetDetails();
                              },
                              closedBuilder: (context, action) {
                                return SizedBox(
                                  height: 70.0,
                                  child: Card(
                                    elevation: 2,
                                    shape: const Border(
                                        left: BorderSide(
                                            color: Colors.blue, width: 5),
                                        right: BorderSide(
                                            color: Colors.blue, width: 5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('${budgets[i]['name']}',
                                                    style: const TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.w500,
                                                    )),
                                               const Text('')
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('${getFormatedDate(
                                                budgets[i]['created_at'])}'),
                                               const  Text('03-03-22')
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  centerTitle: true,
                  toolbarHeight: frameHeight / 13,
                  backgroundColor: const Color(0xFF0096C7),
                  // automaticallyImplyLeading: false,
                  title: Column(
                    children: const [
                      Text('New budget',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            hideForm = true;
                            setState(() {});
                          },
                          icon: const Icon(
                            CupertinoIcons.back,
                            // color: Colors.white,
                            // size: 36.0,
                          ),
                        )),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 90),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
                        Center(
                            child: TextField(
                          style: const TextStyle(fontSize: 16.0),
                          controller:
                              dateEnd, //editing controller of this TextField
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
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
                                borderSide: BorderSide(
                                    color: Color(0xFF0096C7), width: 2.0),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                              // ),
                              border: UnderlineInputBorder(),
                              hintText: 'Budget name',
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: SizedBox(
                                  width: 370.0,
                                  child: ElevatedButton(
                                    // style: raisedButtonStyle,
                                    onPressed: () {
                                      if (DateTime.parse(dateStart.text)
                                          .isBefore(
                                              DateTime.parse(dateEnd.text))) {
                                        getToken().then((value) {
                                          createBudget(value);
                                        });
                                      }
                                    },
                                    child: const Text(
                                      'Add Budget',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                                // FloatingActionButton.extended(
                                //   onPressed: () {
                                //     if (DateTime.parse(dateStart.text)
                                //         .isBefore(DateTime.parse(dateEnd.text))) {
                                //       getToken().then((value) {
                                //         createBudget(value);
                                //       });

                                //       // Navigator.push(
                                //       //     context,
                                //       //     PageTransition(
                                //       //         duration:
                                //       //             const Duration(milliseconds: 700),
                                //       //         reverseDuration:
                                //       //             const Duration(milliseconds: 700),
                                //       //         type: PageTransitionType
                                //       //             .rightToLeftWithFade,
                                //       //         child: Category(budgetId: budgetId)));
                                //     }
                                //   },
                                //   label: const Text(
                                //     'Next',
                                //     style: TextStyle(
                                //       fontSize: 16.0,
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                )
                          ],
                        )
                      ],
                    ),
                  ),
                )));
  }
}

class Element {
  DateTime date;
  String name;
  IconData icon;

  Element(this.date, this.name, this.icon);
}
