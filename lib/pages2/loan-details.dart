import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 80,
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
                    backgroundColor: Color(0xFF8B5E34),
                    child: Icon(
                      CupertinoIcons.chevron_back,
                      color: Colors.white,
                      // size: 20.0,
                    ),
                  ),
                ),
              ),
              title: Text('Loan Details', style: TextStyle(fontSize: 20.0)),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height / 50),
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
                                      color: Color(0xFF8B5E34), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Total Loan',
                              ),
                            ),
                          ),

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
                                      color: Color(0xFF8B5E34), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Total Paid',
                              ),
                            ),
                          ),

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
                                      color: Color(0xFF8B5E34), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Remaining Loan',
                              ),
                            ),
                          ),

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
                                      color: Color(0xFF8B5E34), width: 2.0),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                                // ),
                                border: UnderlineInputBorder(),
                                hintText: 'Remaining Days',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            SizedBox(width: MediaQuery.of(context).size.width / 3.0,
                              child: TextField(
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 16.0),
                              controller:
                                  dateStart, //editing controller of this TextField
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_today),
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
                          ),
                            ),
                          SizedBox(width: MediaQuery.of(context).size.width / 3.0,
                            child: TextField(
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 16.0),
                              controller:
                                  dateStart, //editing controller of this TextField
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_today),
                                  labelText: "Due Date" //label text of field
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
                            ),
                          ),]),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 40),
                         
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: const Text('Pay Loan'),
                          // icon: const Icon(Icons.add),
                          backgroundColor: const Color(0xFF8B5E34),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: const Text('Top Up'),
                          // icon: const Icon(Icons.remove),
                          backgroundColor: const Color(0xFF6F4518),
                        ),
                      ),
                    ])
              ]),
            )));
  }
}
