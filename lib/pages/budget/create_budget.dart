// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:smartmoney/common/theme_helper.dart';
// import 'package:smartmoney/widgets/header_widget.dart';

// class createBudget extends StatefulWidget {
//   const createBudget({Key? key}) : super(key: key);

//   @override
//   State<createBudget> createState() => _createBudgetState();
// }

// class _createBudgetState extends State<createBudget> {
//   double _headerHeight = 200;

//   late TextEditingController _budhetController;
//   var budgetName;
//   var startDate = null;
//   var endDate = null;

//   @override
//   void initState() {
//     super.initState();
//     _budhetController = TextEditingController();
//   }

//   _renderBg() {
//     return Container(
//       decoration: const BoxDecoration(color: Color(0xFF8B5E34)),
//     );
//   }

//   _renderAppBar(context) {
//     return MediaQuery.removePadding(
//       context: context,
//       removeBottom: true,
//       child: AppBar(
//         elevation: 0.0,
//         backgroundColor: const Color(0x00FFFFFF),
//       ),
//     );
//   }

//   _renderContent(context) {
//     return Card(
//       elevation: 0.0,
//       margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
//       color: const Color(0x00000000),
//       // Color(0xFFAAAAAA)
//       child: FlipCard(
//         direction: FlipDirection.HORIZONTAL,
//         speed: 1500,
//         onFlipDone: (status) {
//           print(status);
//         },
//         front: Container(
//           decoration: BoxDecoration(
//             color: Colors.blueAccent,
//             border: Border.all(
//               width: 7.0,
//               color: Colors.blueAccent,
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(20.0),
//             ),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   height: 140.0,
//                   child: AnimatedContainer(
//                     duration: const Duration(seconds: 3),
//                     curve: Curves.fastOutSlowIn,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         RotateAnimatedTextKit(
//                           duration: const Duration(milliseconds: 2000),
//                           pause: const Duration(milliseconds: 1000),
//                           // totalRepeatCount: 4,
//                           repeatForever: true,
//                           text: const [
//                             "BUDGET WITH US",
//                             "SAVE WITH US",
//                             "PLAN WITH US"
//                           ],
//                           textStyle: const TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w900,
//                               color: Color(0xFFE3F2FD)),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(
//                           height: 30.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: ThemeHelper().buttonBoxDecoration(context),
//                   child: ElevatedButton(
//                     style: ThemeHelper().buttonStyle(),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                       child: Text(
//                         startDate == null
//                             ? 'Budget start date'.toUpperCase()
//                             : '$startDate',
//                         style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w900,
//                             color: Color(0xFFE3F2FD)),
//                       ),
//                     ),
//                     onPressed: () async {
//                       DatePicker.showDatePicker(context,
//                           showTitleActions: true,
//                           minTime: DateTime(2022, 1, 5),
//                           maxTime: DateTime(3000, 12, 31),
//                           theme: const DatePickerTheme(
//                               headerColor: Color(0xFF1E88E5),
//                               backgroundColor: Colors.blueAccent,
//                               itemStyle: TextStyle(
//                                   color: Color(0xFFE3F2FD),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18),
//                               doneStyle:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           onChanged: (date) {
//                         setState(() {
//                           startDate = DateFormat.yMMMd().format(date);
//                         });
//                         print('change $date in time zone ' +
//                             date.timeZoneOffset.inHours.toString());
//                       }, onConfirm: (date) {
//                         setState(() {
//                           startDate = DateFormat.yMMMd().format(date);
//                         });
//                         print('confirm $date');
//                       }, currentTime: DateTime.now(), locale: LocaleType.en);
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 Container(
//                   decoration: ThemeHelper().buttonBoxDecoration(context),
//                   child: ElevatedButton(
//                     style: ThemeHelper().buttonStyle(),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                       child: Text(
//                         startDate == null
//                             ? 'Budget end date'.toUpperCase()
//                             : '$endDate',
//                         style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w900,
//                             color: Color(0xFFE3F2FD)),
//                       ),
//                     ),
//                     onPressed: () async {
//                       DatePicker.showDatePicker(context,
//                           showTitleActions: true,
//                           minTime: DateTime(2022, 1, 5),
//                           maxTime: DateTime(3000, 12, 31),
//                           theme: const DatePickerTheme(
//                               headerColor: Color(0xFF1E88E5),
//                               backgroundColor: Colors.blueAccent,
//                               itemStyle: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18),
//                               doneStyle:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           onChanged: (date) {
//                         setState(() {
//                           endDate = DateFormat.yMMMd().format(date);
//                         });
//                         print('change $date in time zone ' +
//                             date.timeZoneOffset.inHours.toString());
//                       }, onConfirm: (date) {
//                         setState(() {
//                           endDate = DateFormat.yMMMd().format(date);
//                         });
//                         print('confirm $date');
//                       }, currentTime: DateTime.now(), locale: LocaleType.en);
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 80.0,
//                 ),
//                 Container(
//                   width: 200.0,
//                   height: 40.0,
//                   decoration: const BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white54,
//                         blurRadius: 4,
//                         offset: Offset(4, 8), // Shadow position
//                       ),
//                     ],
//                   ),
//                   child: const Center(
//                     child: Text('NEXT',
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w900,
//                             color: Color(0xFFE3F2FD))),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         back: Container(
//           decoration: const BoxDecoration(
//             color: Colors.blueAccent,
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   height: 140.0,
//                   child: AnimatedContainer(
//                     duration: const Duration(seconds: 3),
//                     curve: Curves.fastOutSlowIn,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         RotateAnimatedTextKit(
//                           duration: const Duration(milliseconds: 2000),
//                           pause: const Duration(milliseconds: 1000),
//                           // totalRepeatCount: 4,
//                           repeatForever: true,
//                           text: const [
//                             "BUDGET WITH US",
//                             "SAVE WITH US",
//                             "PLAN WITH US"
//                           ],
//                           textStyle: const TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w900,
//                               color: Color(0xFFE3F2FD)),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(
//                           height: 50.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50.0,
//                   child: Text('NAME YOUR BUDGET',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w900,
//                           color: Color(0xFFE3F2FD))),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   child: Container(
//                     child: TextField(
//                       controller: _budhetController,
//                       decoration: ThemeHelper()
//                           .textInputDecoration('Budget', 'Name your budget'),
//                     ),
//                     decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 40.0,
//                 ),
//                 Container(
//                   decoration: ThemeHelper().buttonBoxDecoration(context),
//                   child: ElevatedButton(
//                     style: ThemeHelper().buttonStyle(),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                       child: Text(
//                         'Save'.toUpperCase(),
//                         style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFE3F2FD)),
//                       ),
//                     ),
//                     onPressed: () async {
//                       budgetName = _budhetController.text;
//                       _budhetController.text = '';
//                       Alert(
//                           style: AlertStyle(backgroundColor: Color(0xFFE3F2FD),
//                             animationType: AnimationType.fromTop,
//                             isCloseButton: false,
//                             isOverlayTapDismiss: true,
//                             descStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
//                             animationDuration: const Duration(milliseconds: 800),
//                             alertBorder: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(16.0),
//                               side: const BorderSide(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             titleStyle: const TextStyle(
//                               color: Color(0xFF1E88E5),
//                             ),
//                             // alertAlignment: Alignment.topCenter,
//                           ),
//                           context: context,
//                           title: "Hi User!",
//                           desc: "$budgetName budget has been created.",
//                           image: Image.asset("assets/icon_success.png"),
//                           buttons: [
//                             DialogButton(
//                               child: const Text(
//                                 "PROCEED",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w900,
//                                     color: Colors.white,
//                                     fontSize: 20),
//                               ),
//                               onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
//                               color: const Color.fromRGBO(0, 179, 134, 1.0),
//                               radius: BorderRadius.circular(0.0),
//                             ),
//                           ]).show();
//                     },
//                   ),
//                 ),const SizedBox(height: 30.0,), Container(
//                   width: 200.0,
//                   height: 40.0,
//                   decoration: const BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white54,
//                         blurRadius: 4,
//                         offset: Offset(4, 8), // Shadow position
//                       ),
//                     ],
//                   ),
//                   child: const Center(
//                     child: Text('PREV',
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w900,
//                             color: Color(0xFFE3F2FD))),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             _renderBg(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 // _renderAppBar(context),
//                 SizedBox(
//                   height: _headerHeight,
//                   child: HeaderWidget(
//                       _headerHeight, true, Icons.monetization_on_outlined),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: _renderContent(context),
//                 ),
//                 // Expanded(
//                 //   flex: 1,
//                 //   child: Container(),
//                 // ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
