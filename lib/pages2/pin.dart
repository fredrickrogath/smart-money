import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';
import 'package:http/http.dart' as http;
import 'package:smartmoney/pages2/budget.dart';

class Pin extends StatefulWidget {
  final String name;
  final String phone;
  final String countryCode;
  const Pin(
      {Key? key,
      required this.name,
      required this.phone,
      required this.countryCode})
      : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  double frameHeight = 0;
  double frameWidth = 0;
  String accessToken = '';
  final _controller = TextEditingController();
  bool btnSubmit = false;
  bool passErrors = false;
  String pass = '';
  String mobile = '';
  bool mobileErrors = false;
  bool error = false;

  void login() async {
    var url = Uri.http(domain, '/api/register', {
      'name': widget.name,
      'mobile': widget.countryCode + widget.phone,
      'password': _controller.text
    });

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      // savePassword(jsonResponse['access_token']);
      // jsonResponse['mobile']?? passErrors=true;

      // accessToken = jsonResponse['access_token'][0];
      // print(jsonResponse);

      if (jsonResponse['access_token']?.isNotEmpty ?? false) {
        accessToken = jsonResponse['access_token'];
      }

      passErrors = false;
      mobileErrors = false;

      if (jsonResponse['mobile']?.isNotEmpty ?? false) {
        mobile = jsonResponse['mobile'][0];
        mobileErrors = true;
      }
      if (jsonResponse['password']?.isNotEmpty ?? false) {
        pass = jsonResponse['password'][0];
        passErrors = true;
      }
      savePassword();
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  savePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
    prefs.setString('access_token', accessToken);
  }

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
                        hintText: 'Enter PIN',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              _controller.value.text.isEmpty
                                  ? 'PIN can not be empty'
                                  : '',
                              style: const TextStyle(color: Colors.red)),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: frameHeight / 17.0,
                      width: double.infinity,
                      child: FloatingActionButton.extended(
                        elevation: 0.0,
                        onPressed: () {
                          login();

                          if (mobileErrors == false &&
                              _controller.text.isNotEmpty) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 700),
                                    reverseDuration:
                                        const Duration(milliseconds: 700),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: const Budget()));
                          }

                          if (mobileErrors && _controller.text.isNotEmpty) {
                            var alertStyle = AlertStyle(
                              // animationType: AnimationType.grow,
                              // isCloseButton: false,
                              isButtonVisible: false,
                              isOverlayTapDismiss: false,
                              descStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              // descTextAlign: TextAlign.center,
                              animationDuration:
                                  const Duration(milliseconds: 000),
                              alertBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              // titleStyle: TextStyle(
                              //   color: const Color(0xFF24564F),
                              // ),
                              alertAlignment: Alignment.center,
                            );
                            Alert(
                              context: context,
                              style: alertStyle,
                              type: AlertType.warning,
                              // title: "Select Scan Type",
                              content: Column(
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      child: Flex(
                                          direction: Axis.vertical,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: mobileErrors
                                                  ? Text(
                                                      mobile,
                                                      style: const TextStyle(
                                                          fontSize: 14.0),
                                                    )
                                                  : const SizedBox(
                                                      height: 0.0,
                                                    ),
                                            ),
                                            // if (passErrors)
                                            //   Text(pass,
                                            //       style: const TextStyle(
                                            //           fontSize: 14.0))
                                            // else
                                            //   const SizedBox(
                                            //     height: 0.0,
                                            //   )
                                          ]))
                                ],
                              ),
                            ).show();
                          }
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
