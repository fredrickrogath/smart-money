// import 'package:flutter/material.dart';
// import 'package:smartmoney/common/theme_helper.dart';
// import 'package:smartmoney/pages/welcome/welcome.dart';
// import 'package:smartmoney/widgets/header_widget.dart';

// // import 'profile_page.dart';

// class RegistrationPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _RegistrationPageState();
//   }
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool checkedValue = false;
//   bool checkboxValue = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFF8B5E34),
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               const SizedBox(
//                 height: 210,
//                 child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(25, 80, 25, 10),
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(100),
//                                     border:
//                                         Border.all(width: 5, color: const Color(0xFFBC8A5F)),

//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black12,
//                                         blurRadius: 20,
//                                         offset: Offset(5 , 5),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Colors.grey.shade300,
//                                     size: 80.0,
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.fromLTRB(65, 65, 0, 0),
//                                   child: Icon(
//                                     Icons.add_circle,
//                                     color: Colors.grey.shade700,
//                                     size: 25.0,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),

//                           Container(
//                             child: TextFormField(
//                               decoration: ThemeHelper().textInputDecoration(
//                                   'Full Name', 'Enter your full name'),
//                             ),
//                             decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                           ),
//                           const SizedBox(height: 20.0),
//                           Container(
//                             child: TextFormField(
//                               decoration: ThemeHelper().textInputDecoration(
//                                   "E-mail address", "Enter your email"),
//                               keyboardType: TextInputType.emailAddress,
//                               validator: (val) {
//                                 if (!(val!.isEmpty) &&
//                                     !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
//                                         .hasMatch(val)) {
//                                   return "Enter a valid email address";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                           ),
//                           const SizedBox(height: 20.0),
//                           Container(
//                             child: TextFormField(
//                               decoration: ThemeHelper().textInputDecoration(
//                                   "Mobile Number", "Enter your mobile number"),
//                               keyboardType: TextInputType.phone,
//                               validator: (val) {
//                                 if (!(val!.isEmpty) &&
//                                     !RegExp(r"^(\d+)*$").hasMatch(val)) {
//                                   return "Enter a valid phone number";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                           ),
//                           const SizedBox(height: 20.0),
//                           Container(
//                             child: TextFormField(
//                               obscureText: true,
//                               decoration: ThemeHelper().textInputDecoration(
//                                   "Password*", "Enter your password"),
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return "Please enter your password";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                           ),
//                           const SizedBox(height: 20.0),
//                           Container(
//                             child: TextFormField(
//                               obscureText: true,
//                               decoration: ThemeHelper().textInputDecoration(
//                                   "Confirm password*", "Confirm your password"),
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return "Please enter your password";
//                                 }
//                                 return null;
//                               },
//                             ),
//                             decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                           ),
//                           const SizedBox(height: 10.0),
//                           FormField<bool>(
//                             builder: (state) {
//                               return Column(
//                                 children: <Widget>[
//                                   Row(
//                                     children: <Widget>[
//                                       Checkbox(
//                                           value: checkboxValue,
//                                           onChanged: (value) {
//                                             setState(() {
//                                               checkboxValue = value!;
//                                               state.didChange(value);
//                                             });
//                                           }),
//                                       const Text(
//                                         "I accept all terms and conditions.",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       state.errorText ?? '',
//                                       textAlign: TextAlign.left,
//                                       style: TextStyle(
//                                         color: Theme.of(context).errorColor,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               );
//                             },
//                             validator: (value) {
//                               if (!checkboxValue) {
//                                 return 'You need to accept terms and conditions';
//                               } else {
//                                 return null;
//                               }
//                             },
//                           ),
//                           Container(
//                             decoration:
//                                 ThemeHelper().buttonBoxDecoration(context),
//                             child: ElevatedButton(
//                               style: ThemeHelper().buttonStyle(),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                                 child: Text(
//                                   "Get started".toUpperCase(),
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 // if (_formKey.currentState!.validate()) {
//                                 Navigator.of(context).pushAndRemoveUntil(
//                                     MaterialPageRoute(
//                                         builder: (context) => welcomePage()),
//                                     (Route<dynamic> route) => false);
//                                 // }
//                               },
//                             ),
//                           ),
//                           // SizedBox(height: 30.0),
//                           // Text(
//                           //   "Or create account using social media",
//                           //   style: TextStyle(color: Colors.grey),
//                           // ),
//                           // SizedBox(height: 25.0),
//                           // Row(
//                           //   mainAxisAlignment: MainAxisAlignment.center,
//                           //   children: [
//                           // GestureDetector(
//                           //   child: FaIcon(
//                           //     FontAwesomeIcons.googlePlus,
//                           //     size: 35,
//                           //     color: HexColor("#EC2D2F"),
//                           //   ),
//                           //   onTap: () {
//                           //     setState(() {
//                           //       showDialog(
//                           //         context: context,
//                           //         builder: (BuildContext context) {
//                           //           return ThemeHelper().alartDialog(
//                           //               "Google Plus",
//                           //               "You tap on GooglePlus social icon.",
//                           //               context);
//                           //         },
//                           //       );
//                           //     });
//                           //   },
//                           // ),
//                           // SizedBox(
//                           //   width: 30.0,
//                           // ),
//                           // GestureDetector(
//                           //   child: Container(
//                           //     padding: EdgeInsets.all(0),
//                           //     decoration: BoxDecoration(
//                           //       borderRadius: BorderRadius.circular(100),
//                           //       border: Border.all(
//                           //           width: 5, color: HexColor("#40ABF0")),
//                           //       color: HexColor("#40ABF0"),
//                           //     ),
//                           //     child: FaIcon(
//                           //       FontAwesomeIcons.twitter,
//                           //       size: 23,
//                           //       color: HexColor("#FFFFFF"),
//                           //     ),
//                           //   ),
//                           //   onTap: () {
//                           //     setState(() {
//                           //       showDialog(
//                           //         context: context,
//                           //         builder: (BuildContext context) {
//                           //           return ThemeHelper().alartDialog(
//                           //               "Twitter",
//                           //               "You tap on Twitter social icon.",
//                           //               context);
//                           //         },
//                           //       );
//                           //     });
//                           //   },
//                           // ),
//                           // SizedBox(
//                           //   width: 30.0,
//                           // ),
//                           // GestureDetector(
//                           //   child: FaIcon(
//                           //     FontAwesomeIcons.facebook,
//                           //     size: 35,
//                           //     color: HexColor("#3E529C"),
//                           //   ),
//                           //   onTap: () {
//                           //     setState(() {
//                           //       showDialog(
//                           //         context: context,
//                           //         builder: (BuildContext context) {
//                           //           return ThemeHelper().alartDialog(
//                           //               "Facebook",
//                           //               "You tap on Facebook social icon.",
//                           //               context);
//                           //         },
//                           //       );
//                           //     });
//                           //   },
//                           // ),
//                           // ],
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
