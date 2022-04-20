// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:smartmoney/common/theme_helper.dart';
// import 'package:smartmoney/home_page.dart';
// import 'package:smartmoney/pages/auth/forgot_password_page.dart';
// import 'package:smartmoney/pages/auth/registration_page.dart';
// import 'package:smartmoney/widgets/header_widget.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   double _headerHeight = 200;
//   Key _formKey = GlobalKey<FormState>();
//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFF8B5E34),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: _headerHeight,
//                 child: HeaderWidget(_headerHeight, true, Icons.person),
//               ),
//               SafeArea(
//                 child: Container(
//                     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                     margin: const EdgeInsets.fromLTRB(
//                         20, 10, 20, 10), // This will be the login form
//                     child: Column(
//                       children: [
//                         const Text(
//                           'Smart Money',
//                           style: TextStyle(
//                               fontSize: 40,
//                               // color: Colors.indigoAccent,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         const Text(
//                           '',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         const SizedBox(height: 10.0),
//                         Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   child: TextField(
//                                     controller: _emailController,
//                                     decoration: ThemeHelper().textInputDecoration(
//                                         'Email', 'Enter your email'),
//                                   ),
//                                   decoration:
//                                       ThemeHelper().inputBoxDecorationShaddow(),
//                                 ),
//                                 const SizedBox(height: 30.0),
//                                 Container(
//                                   child: TextField(
//                                     controller: _passwordController,
//                                     obscureText: true,
//                                     decoration: ThemeHelper().textInputDecoration(
//                                         'Password', 'Enter your password'),
//                                   ),
//                                   decoration:
//                                       ThemeHelper().inputBoxDecorationShaddow(),
//                                 ),
//                                 const SizedBox(height: 15.0),
//                                 Container(
//                                   margin:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 20),
//                                   alignment: Alignment.topRight,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const ForgotPasswordPage()),
//                                       );
//                                     },
//                                     child: const Text(
//                                       "Forgot your password?",
//                                       style: TextStyle(
//                                         // color: Colors.lightBlue,
//                                         fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration:
//                                       ThemeHelper().buttonBoxDecoration(context),
//                                   child: ElevatedButton(
//                                     style: ThemeHelper().buttonStyle(),
//                                     child: Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           40, 10, 40, 10),
//                                       child: Text(
//                                         'Sign In'.toUpperCase(),
//                                         style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white
//                                         ),
//                                       ),
//                                     ),
//                                     onPressed: () async {
//                                       // await ApiService()
//                                       //     .loginUser(User(
//                                       //         email: _emailController.text,
//                                       //         password: _passwordController.text))
//                                       //     .then((data) {
//                                       //   if (data.access_token!.isNotEmpty) {
//                                       //     Navigator.pushReplacement(
//                                       //         context,
//                                       //         MaterialPageRoute(
//                                       //             builder: (context) =>
//                                       //                 ProfilePage()));
//                                       //   } else {
//                                       //     showAlert(
//                                       //         context: context, title: data.msg);
//                                       //   }
//                                       //   ;
//                                       // });

//                                       //After successful login we will redirect to profile page. Let's create profile page now

//                                       Navigator.push(
//                                         context,
//                                         PageTransition(
//                                           duration:
//                                               const Duration(milliseconds: 700),
//                                           reverseDuration:
//                                               const Duration(milliseconds: 500),
//                                           type: PageTransitionType.topToBottom,
//                                           child: homePage(),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 Container(
//                                   margin:
//                                       const EdgeInsets.fromLTRB(10, 20, 10, 20),
//                                   //child: Text('Don\'t have an account? Create'),
//                                   child: Text.rich(TextSpan(children: [
//                                     const TextSpan(
//                                         text: "Don't have an account? ", style: TextStyle(fontWeight: FontWeight.bold,)),
//                                     TextSpan(
//                                       text: 'signup',
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           // Navigator.push(
//                                           //     context,
//                                           //     MaterialPageRoute(
//                                           //         builder: (context) =>
//                                           //             RegistrationPage()));

//                                           Navigator.push(
//                                             context,
//                                             PageTransition(
//                                               duration: const Duration(
//                                                   milliseconds: 500),
//                                               reverseDuration: const Duration(
//                                                   milliseconds: 500),
//                                               type: PageTransitionType
//                                                   .leftToRightWithFade,
//                                               child: RegistrationPage(),
//                                             ),
//                                           );
//                                         },
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         fontSize: 18.0
//                                     )),
//                                   ])),
//                                 ),
//                               ],
//                             )),
//                       ],
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
