import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: MediaQuery.of(context).size.height / 4.0,
            backgroundColor: const Color(0xFF6F4518),
            title: Column(
              children: const [
                Text('Welcome', style: TextStyle(fontSize: 25.0)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Enter your pin to login',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400)),
                )
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
                  SizedBox(height: MediaQuery.of(context).size.height / 15),

                  const TextField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF8B5E34), width: 2.0),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                      // ),
                      border: OutlineInputBorder(),
                      hintText: 'Enter pin',
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
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 2.0,
                    height: MediaQuery.of(context).size.height / 18.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF6F4518), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
