import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartmoney/pages2/budget.dart';
import 'package:smartmoney/pages2/new-budget.dart';
import 'package:smartmoney/pages2/welcome.dart';

class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
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
            backgroundColor: const Color(0xFF0096C7),
            title: Column(
              children: const [
                Text('Create PIN',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 10.0),
                //   child: Text('Welcome to CashBook',
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 15),

                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: const TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF0096C7), width: 2.0),
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                        // ),
                        border: UnderlineInputBorder(),
                        hintText: 'Enter PIN',
                      ),
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
                  // SizedBox(width: MediaQuery.of(context).size.height /2.0,
                  // height: MediaQuery.of(context).size.height /18.0,
                  //   child:   ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: const Color(0xFF6F4518), // background
                  //       onPrimary: Colors.white, // foreground
                  //     ),
                  //     onPressed: () { },
                  //     child: Text('Submit',style: TextStyle(fontSize:18.0),),
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
                                  child: const Budget()));
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
          )),
    );
  }
}
