import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';

class InEntry extends StatefulWidget {
  const InEntry({Key? key}) : super(key: key);

  @override
  State<InEntry> createState() => _InEntryState();
}

class _InEntryState extends State<InEntry> {
  final _controller = TextEditingController();

  double frameHeight = 0;
  double frameWidth = 0;

  var accessToken;

  final _formKey = GlobalKey<FormState>();

  // List<String> categoryLIst = [
  //   'Ujasi',
  //   'Msalato',
  // ];

  String? selectedValue;

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  // void getCategories(token) async {
  //   var url = Uri.http(
  //     domain,
  //     '/api/getCategories',
  //   );

  //   Map<String, String> requestHeaders = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };

  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.post(url, headers: requestHeaders);
  //   if (response.statusCode == 200) {
  //     // categories = jsonDecode(response.body)['data'];
  //     categories = json.decode(response.body);
  //     // categories.cast<String>();
  //     // categoryLIst = Map<String, dynamic>.from(json.decode(response.body))['data'].cast<String>();
  //     print(categories);
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }

  //   setState(() {});
  // }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      // getCategories(accessToken);
      // getExpense(accessToken);
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
    frameWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cash In Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 30),

              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF0096C7), width: 2.0),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                    // ),
                    border: UnderlineInputBorder(),
                    hintText: 'Amount',
                  ),
                ),
              ),
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Text(

              //             btnSubmit && !_controller.value.text.isNotEmpty
              //                 ? 'Name can not be empty'
              //                 : '',
              //             style: const TextStyle(color: Colors.red)),
              //       ],
              //     )),

              SizedBox(height: MediaQuery.of(context).size.height / 30),

              // DropdownButtonFormField2(
              //   decoration: InputDecoration(
              //     //Add isDense true and zero Padding.
              //     //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
              //     isDense: true,
              //     contentPadding: EdgeInsets.zero,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     //Add more decoration as you want here
              //     //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
              //   ),
              //   isExpanded: true,
              //   hint: const Text(
              //     'Category',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   icon: const Icon(
              //     Icons.arrow_drop_down,
              //     color: Colors.black45,
              //   ),
              //   iconSize: 30,
              //   buttonHeight: 60,
              //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              //   dropdownDecoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   items: categories
                
              //       .map((item) => DropdownMenuItem<String>(
              //             value: item,
                          
              //             child: Text(
              //               item.to,
              //               style: const TextStyle(
              //                 fontSize: 14,
              //               ),
              //             ),
              //           ))
              //       .toList(),
              //   // validator: (value) {
              //   //   if (value == null) {
              //   //     return 'Please select gender.';
              //   //   }
              //   // },
              //   onChanged: (value) {
              //     //Do something when changing the item if you want.
              //   },
              //   onSaved: (value) {
              //     selectedValue = value.toString();
              //   },
              // ),


              // DropdownButton(
              //                   isExpanded: true,
              //                   value: categories,
              //                   hint: Text("Select "),
              //                   items: countries.map((countryone){
              //                     return DropdownMenuItem(
              //                       child: Text(countryone), //label of item
              //                       value: countryone, //value of item
              //                     );
              //                    }).toList(), 
              //                    onChanged: (value){
              //                        countryname = value; //change the country name
              //                        getCity(); //get city list.
              //                    },
              //               ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: frameHeight / 17.0,
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    elevation: 0.0,
                    onPressed: () {
                      setState(() {});
                      if (_controller.value.text.isNotEmpty) {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         duration: const Duration(milliseconds: 700),
                        //         reverseDuration:
                        //             const Duration(milliseconds: 700),
                        //         type:
                        //             PageTransitionType.rightToLeftWithFade,
                        //         child: Welcome(name:_controller.text)));
                      }
                    },
                    label: Text('Select category', style: TextStyle(color: Colors.grey[700]),),
                    // icon: const Icon(Icons.remove),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height / 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: frameHeight / 17.0,
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    elevation: 0.0,
                    onPressed: () {
                      setState(() {});
                      if (_controller.value.text.isNotEmpty) {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         duration: const Duration(milliseconds: 700),
                        //         reverseDuration:
                        //             const Duration(milliseconds: 700),
                        //         type:
                        //             PageTransitionType.rightToLeftWithFade,
                        //         child: Welcome(name:_controller.text)));
                      }
                    },
                    label: const Text('Save'),
                    // icon: const Icon(Icons.remove),
                    backgroundColor: const Color(0xFF0096C7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
