import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/pages/auth/login_page.dart';
import 'package:smartmoney/pages/auth/registration_page.dart';
import 'package:smartmoney/pages/budget/create_budget.dart';
import 'package:smartmoney/pages/home/home.dart';
import 'package:smartmoney/pages/loan/loan_management.dart';
import 'package:smartmoney/pages/welcome/welcome.dart';
import 'package:smartmoney/pages2/budget.dart';
import 'package:smartmoney/pages2/category.dart';
import 'package:smartmoney/pages2/create-event.dart';
import 'package:smartmoney/pages2/entry.dart';
import 'package:smartmoney/pages2/estimator.dart';
import 'package:smartmoney/pages2/event-details.dart';
import 'package:smartmoney/pages2/events.dart';
import 'package:smartmoney/pages2/loan-details.dart';
import 'package:smartmoney/pages2/name.dart';
import 'package:smartmoney/pages2/new-budget.dart';
import 'package:smartmoney/pages2/new-loan.dart';
import 'package:smartmoney/pages2/otp.dart';
import 'package:smartmoney/pages2/payer.dart';
import 'package:smartmoney/pages2/pin.dart';
import 'package:smartmoney/pages2/shopping-list.dart';
import 'package:smartmoney/pages2/welcome.dart';
import 'package:smartmoney/themes/primary_swatch.dart';

import 'home_page.dart';
// import 'package:smartmoney/pages/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart money',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(0xFF0096C7, color),
      ),
      home: const MyHomePage(title: 'Smart Money'),
      initialRoute: '/',
      routes: {
        // When navigating to the "/homePage" route, build the homePage widget.
        // '/home': (context) => const home(),
        // When navigating to the "/createBudget" route, build the createBudget widget.
        // '/createBudget': (context) => createBudget(),
        // When navigating to the "/loanManagement" route, build the loanManagement widget.
        // '/loanManagement': (context) => const loanManagement(),
        // When navigating to the "/home" route, build the home widget.
        // '/home': (context) => const home(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   var budgetId;

  isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin');
  }

  getBudgetId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('budgetId');
  }

  @override
  void initState() {
    // TODO: implement initState
    getBudgetId().then((value) {
      budgetId = value;
      print(budgetId);
    });

    isLogin().then((value) {
      print('is login : $value');
      if (value.isNotEmpty()) {
        // Navigator.push(
        //     context,
        //     PageTransition(
        //         duration: const Duration(milliseconds: 700),
        //         reverseDuration: const Duration(milliseconds: 700),
        //         type: PageTransitionType.rightToLeftWithFade,
        //         child: Entry(budgetId: budgetId)));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: homePage(),
        backgroundColor: const Color(0xFF0096C7),
        body: AnimatedSplashScreen(
            // centered: false,
            splashIconSize: double.maxFinite,
            duration: 4000,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: TextLiquidFill(
                    text: 'Smart Money',
                    waveColor: Colors.white,
                    boxBackgroundColor: const Color(0xFF0096C7),
                    textStyle: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 15.0,
                ),
                CircleAvatar(
                  // backgroundColor: const Color(0xFF24564F),
                  radius: MediaQuery.of(context).size.height / 11.0,
                  child: ClipOval(
                    child: Image.asset('assets/logo/fredrick.png'),
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Card(
                    color: const Color(0xFF0096C7),
                    elevation: 0.0,
                    child: Column(
                      children: const [
                        // Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Text('OUR PROMISE',
                        //       style: TextStyle(
                        //           fontSize: 18,
                        //           fontStyle: FontStyle.italic,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white)),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('100% safe & free',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                )
                // Image.asset(
                //   "assets/welcome.gif",
                //   fit: BoxFit.cover,
                //   height: double.infinity,
                //   width: double.infinity,
                //   alignment: Alignment.center,
                // ),
              ],
            ),
            nextScreen: const Name(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xFF0096C7)),
      ),
    );
  }
}
