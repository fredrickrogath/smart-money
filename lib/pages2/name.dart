import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/pages2/budget.dart';
import 'package:smartmoney/pages2/entry.dart';
import 'package:smartmoney/pages2/welcome.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _controller = TextEditingController();
  bool btnSubmit = false;
  double frameHeight = 0;
  double frameWidth = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    frameWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: frameHeight / 13,
            backgroundColor: const Color(0xFF0096C7),
            title: Column(
              children: const [
                Text('Welcome To SmartMoney',
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
                  const SizedBox(height: 10.0),

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
                        hintText: 'Enter your name',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              btnSubmit && !_controller.value.text.isNotEmpty
                                  ? 'Name can not be empty'
                                  : '',
                              style: const TextStyle(color: Colors.red)),
                        ],
                      )),
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
                  const SizedBox(height: 10),
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
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child:

                          // SizedBox(
                          //   height: frameHeight / 17.0,
                          //   width: double.infinity,
                          //   child: FloatingActionButton.extended(
                          //     elevation: 0.0,
                          //     onPressed: () {
                          //       btnSubmit = true;
                          //       setState(() {});
                          //       if (_controller.value.text.isNotEmpty) {
                          //         Navigator.push(
                          //             context,
                          //             PageTransition(
                          //                 duration: const Duration(milliseconds: 700),
                          //                 reverseDuration:
                          //                     const Duration(milliseconds: 700),
                          //                 type:
                          //                     PageTransitionType.rightToLeftWithFade,
                          //                 child: Welcome(name: _controller.text)));
                          //       }
                          //     },
                          //     label: const Text('Submit'),
                          //     // icon: const Icon(Icons.remove),
                          //     backgroundColor: const Color(0xFF0096C7),
                          //   ),
                          // ),
                          SizedBox(
                        width: 370.0,
                        child: ElevatedButton(
                          // style: raisedButtonStyle,
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            FocusManager.instance.primaryFocus?.unfocus();
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 700),
                                    reverseDuration:
                                        const Duration(milliseconds: 700),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: Welcome(name: _controller.text)));
                          },
                          child: isLoading
                              ? Center(
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )
                              : const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
