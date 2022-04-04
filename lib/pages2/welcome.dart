import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartmoney/pages2/otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                radius: 30.0,
                // backgroundColor: Color(0xFF8B5E34),
                child: Icon(
                  CupertinoIcons.phone_arrow_up_right,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            title: Column(
              children: const [
                Text('Welcome', style:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 8.0),
                //   child: Text('Login to manage your budgets',
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
            child: Column(
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height / 40),
                SizedBox(height: MediaQuery.of(context).size.height / 23),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 12,
                //   child: DropdownSearch<String>(
                //     mode: Mode.MENU,
                //     // popupBackgroundColor: Colors.yellow,
                //     popupBarrierColor: const Color(0xFF8B5E34),
                //     showSelectedItems: true,
                //     items: const [
                //       "Tanzania",
                //       "Kenya",
                //       "Uganda",
                //       'Rwanda',
                //       "Burundi",
                //     ],
                //     label: "Select Country",
                //     // hint: "country in menu mode",
                //     // popupItemDisabled: (String s) =>
                //     //     s.startsWith('I'),
                //     onChanged: print,
                //   ),
                // ),
                // SizedBox(height: MediaQuery.of(context).size.height / 30),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 12,
                //   child: DropdownSearch<String>(
                //     mode: Mode.MENU,
                //     // showSelectedItem: true,
                //     items: const [
                //       "+255",
                //       "+254",
                //       "+253",
                //       "+252",
                //     ],
                //     label: "Code",
                //     // hint: "country in menu mode",
                //     // popupItemDisabled: (String s) =>
                //     //     s.startsWith('I'),
                //     onChanged: print,
                //   ),
                // ),
                // TextFormField(
                //   initialValue: 'Tanzania',
                //   decoration: const InputDecoration(
                //     labelText: 'Select region',
                //     // errorText: 'Error message',
                //     border: OutlineInputBorder(),
                //     suffixIcon: Icon(
                //       Icons.arrow_downward_rounded,
                //     ),
                //   ),
                // ),
                // SizedBox(height: MediaQuery.of(context).size.height / 40),
                // const TextField(
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: Color(0xFF8B5E34), width: 2.0),
                //     ),
                //     // enabledBorder: OutlineInputBorder(
                //     //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                //     // ),
                //     border: OutlineInputBorder(),
                //     hintText: 'Mobile number',
                //   ),
                // ),

                Container( 
                  child:IntlPhoneField(
                        decoration: InputDecoration( //decoration for Input Field
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                            ),
                        ),
                        initialCountryCode: 'NP', //default contry code, NP for Nepal
                        onChanged: (phone) {
                            //when phone number country code is changed
                            print(phone.completeNumber); //get complete number
                            print(phone.countryCode); // get country code only
                            print(phone.number); // only phone number
                        },
                    ) 
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 30),
                // SizedBox(
                //   width: MediaQuery.of(context).size.height / 2.0,
                //   height: MediaQuery.of(context).size.height / 20.0,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       primary: const Color(0xFF6F4518), // background
                //       onPrimary: Colors.white, // foreground
                //     ),
                //     onPressed: () {Navigator.push(
                //                 context,
                //                 PageTransition(
                //                     duration: const Duration(milliseconds: 600),
                //                     reverseDuration:
                //                         const Duration(milliseconds: 600),
                //                     type:
                //                         PageTransitionType.leftToRightWithFade,
                //                     child: const Otp()))
                //             ;},
                //     child: const Text(
                //       'Submit',
                //       style: TextStyle(fontSize: 18.0),
                //     ),
                //   ),
                // ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: SizedBox(
                      height: frameHeight / 17.0,
                      width: double.infinity,
                      
                      child: FloatingActionButton.extended(
                        elevation:0.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 700),
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const Otp()));
                        },
                        label: const Text('Submit'),
                        // icon: const Icon(Icons.remove),
                        backgroundColor: const Color(0xFF0096C7),
                      ),
                    ),
                  ),

                SizedBox(height: MediaQuery.of(context).size.height / 30),

                // RichText(
                //   textAlign: TextAlign.center,
                //   text: const TextSpan(
                //     text: 'By creating an account, you agree to our ',
                //     style: TextStyle(color: Colors.black, fontSize: 14.0),
                //     children: <TextSpan>[
                //       TextSpan(
                //           text: 'Terms',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Color(0xFF8B5E34))),
                //       TextSpan(text: ' and!'),
                //       TextSpan(
                //           text: ' conditions',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Color(0xFF8B5E34))),
                //     ],
                //   ),
                // )
              ],
            ),
          )),
    );
  }
}
