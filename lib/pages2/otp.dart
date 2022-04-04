import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartmoney/pages2/name.dart';
import 'package:smartmoney/pages2/pin.dart';
// import './constants/constants.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);
  final String? phoneNumber = '+255715983180';

  // PinCodeVerificationScreen(this.phoneNumber);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/logo/fredrick.png"),
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: "${widget.phoneNumber}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: const TextStyle(color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        obscuringWidget: const FlutterLogo(
                          size: 24,
                        ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          inactiveColor:const Color(0xFF0096C7),
                          inactiveFillColor:Color(0xFF0096C7),
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the code? ",
                      style: const TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () => snackBar("OTP resend!!"),
                        child: const Text(
                          "RESEND",
                          style: TextStyle(
                              color: Color(0xFF0096C7),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: SizedBox(height:MediaQuery.of(context).size.height / 17.0,
                    child: ButtonTheme(
                      // height: 50,
                      buttonColor: Colors.yellow,
                      child: TextButton(
                        onPressed: () {
                          formKey.currentState!.validate();
                          // conditions for validating
                          if (currentText.length != 6 ||
                              currentText != "123456") {
                            errorController!.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() => hasError = true);
                          } else {
                            setState(
                              () {
                                hasError = false;
                                snackBar("OTP Verified!!");
                              },
                            );
                          }

                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 700),
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  type: PageTransitionType.bottomToTop,
                                  child: const Pin()));
                        },
                        child: Center(
                            child: Text(
                          "Verify",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,),
                        )),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xFF0096C7),
                      borderRadius: BorderRadius.circular(5),
                      // boxShadow: const[
                      //   // BoxShadow(
                      //   //     color:  Color(0xFF0096C7),
                      //   //     offset: Offset(1, -2),
                      //   //     blurRadius: 5),
                      //   // BoxShadow(
                      //   //     color: Color(0xFF0096C7),
                      //   //     offset: Offset(-1, 2),
                      //   //     blurRadius: 5)
                      // ]
                      ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height /40,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Flexible(
                //         child: TextButton(
                //       child: const Text("Clear"),
                //       onPressed: () {
                //         textEditingController.clear();
                //       },
                //     )),
                //     Flexible(
                //         child: TextButton(
                //       child: const Text("Set Text"),
                //       onPressed: () {
                //         setState(() {
                //           textEditingController.text = "123456";
                //         });
                //       },
                //     )),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
