import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartmoney/pages2/budget.dart';
import 'package:smartmoney/pages2/entry.dart';
import 'package:smartmoney/pages2/estimator.dart';
import 'package:smartmoney/pages2/events.dart';
import 'package:smartmoney/pages2/payer.dart';

class appBarr extends StatefulWidget {
  const appBarr({Key? key}) : super(key: key);

  @override
  State<appBarr> createState() => _appBarrState();
}

class _appBarrState extends State<appBarr> {
  double frameHeight = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Thomas'),
          ),
          SizedBox(
            height: frameHeight / 15,
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home",
                  style: TextStyle(color: Colors.black, fontSize: 16.0)),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 600),
                        reverseDuration: const Duration(milliseconds: 600),
                        type: PageTransitionType.leftToRightWithFade,
                        child: const Entry()));
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on_rounded),
            title: const Text("Budget",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 600),
                      type: PageTransitionType.leftToRightWithFade,
                      child: const Budget()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text("Events",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 600),
                      type: PageTransitionType.leftToRightWithFade,
                      child: const Events()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.money_off),
            title: const Text("Loan Management",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 600),
                      type: PageTransitionType.leftToRightWithFade,
                      child: const Payer()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Budget Estimator",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      reverseDuration: const Duration(milliseconds: 600),
                      type: PageTransitionType.leftToRightWithFade,
                      child: const Estimator()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text("Report",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         duration: const Duration(milliseconds: 600),
              //         reverseDuration: const Duration(milliseconds: 600),
              //         type: PageTransitionType.leftToRightWithFade,
              //         child: const Budget()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: const Text("Profile",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         duration: const Duration(milliseconds: 600),
              //         reverseDuration: const Duration(milliseconds: 600),
              //         type: PageTransitionType.leftToRightWithFade,
              //         child: const Budget()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail_outlined),
            title: const Text("Contact Us",
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
            onTap: () {
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         duration: const Duration(milliseconds: 600),
              //         reverseDuration: const Duration(milliseconds: 600),
              //         type: PageTransitionType.leftToRightWithFade,
              //         child: const Budget()));
            },
          ),
          // ListTile(
          //   leading: const Padding(
          //     padding: EdgeInsets.only(top:5.0),
          //     child: Icon(Icons.calculate),
          //   ),
          //   title: ExpansionTile(
          //     title: const Text("Extra", style: TextStyle(fontSize: 16.0)),
          //     children: <Widget>[
          //       TextButton(
          //         onPressed: () {},
          //         child: const Text("1123123123"),
          //       ),
          //       TextButton(onPressed: () {}, child: const Text("43243242"))
          //     ],
          //   ),
          //   // onTap: () {
          //   //   Navigator.push(
          //   //       context,
          //   //       PageTransition(
          //   //           duration: const Duration(milliseconds: 600),
          //   //           reverseDuration: const Duration(milliseconds: 600),
          //   //           type: PageTransitionType.leftToRightWithFade,
          //   //           child: const Estimator()));
          //   // },
          // ),
        ],
      ),
    );
  }
}
