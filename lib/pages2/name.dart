import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:smartmoney/pages2/budget.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
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
                Text('Enter your name', style: TextStyle(fontSize: 25.0)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Welcome to CashBook',
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

                  SizedBox(width: MediaQuery.of(context).size.width/1.2,
                    child: const TextField(
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF8B5E34), width: 2.0),
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: const Color(0xFF8B5E34), width: 2.0),
                        // ),
                        border: UnderlineInputBorder(),
                        hintText: 'Enter your name',
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

                  OpenContainer(
                    closedColor: const Color(0xFF6F4518),
                    openColor: const Color(0xFF6F4518),
                    closedElevation: 0.0,
                    openElevation: 0.0,
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 1000),
                    openBuilder: (context, action) {
                      return const Budget();
                    },
                    closedBuilder: (context, action) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                // ignore: unrelated_type_equality_checks
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
