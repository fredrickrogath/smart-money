import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartmoney/pages2/event-details.dart';
import 'package:smartmoney/pages2/loan-details.dart';
import 'package:smartmoney/pages2/new-loan.dart';

class Payer extends StatefulWidget {
  const Payer({Key? key}) : super(key: key);

  @override
  State<Payer> createState() => _PayerState();
}

class _PayerState extends State<Payer> {
  double frameHeight = 0;
  double frameWidth = 0;

  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    frameWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: frameHeight / 10,
        // backgroundColor: const Color(0xFF6F4518),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const CircleAvatar(
              radius: 30.0,
              backgroundColor: Color(0xFF0096C7),
              child: Icon(
                CupertinoIcons.chevron_back,
                color: Colors.white,
                // size: 20.0,
              ),
            ),
          ),
        ),
        title: const Text('Payer',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10.0),
          //   child: SizedBox(
          //       height: MediaQuery.of(context).size.height / 20.0,
          //       child:
          //           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //         Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //             child: Text('My Saved Events ',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     background: Paint()
          //                       ..color = const Color(0xFF6F4518)
          //                       ..strokeWidth = 20
          //                       ..strokeJoin = StrokeJoin.round
          //                       ..strokeCap = StrokeCap.round
          //                       ..style = PaintingStyle.stroke,
          //                     color: Colors.white,
          //                     fontSize: 16.0))),
          //         // FloatingActionButton(
          //         //   onPressed: () {
          //         //     // Add your onPressed code here!
          //         //   },
          //         //   backgroundColor: const Color.fromARGB(255, 118, 192, 121),
          //         //   child: const Icon(Icons.add),
          //         // ),
          //       ])),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: 20,
                itemBuilder: (context, i) {
                  return OpenContainer(
                    // closedColor: const Color(0xFF6F4518),
                    // openColor: const Color(0xFF6F4518),
                    closedElevation: 0.0,
                    openElevation: 0.0,
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 500),
                    openBuilder: (context, action) {
                      return const LoanDetails();
                    },
                    closedBuilder: (context, action) {
                      return Card(
                        // color:Color(0xFF0096C7),
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Thomas',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Interest : 5%'),
                                  Text('Loan : ${myFormat.format(130000)}')
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: frameHeight / 10,
            width: double.infinity,
            child: Container(
                color: Colors.white,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         Row(
                  //           children: const [
                  //             Text('added income : ',
                  //                 style: TextStyle(
                  //                   fontSize: 16.0,
                  //                 )),
                  //             Text('0',
                  //                 style: TextStyle(
                  //                     fontSize: 16.0,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.green)),
                  //           ],
                  //         ),
                  //         Row(
                  //           children: const [
                  //             Text('added expenses category : ',
                  //                 style: TextStyle(
                  //                   fontSize: 16.0,
                  //                 )),
                  //             Text('0',
                  //                 style: TextStyle(
                  //                     fontSize: 16.0,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.blue)),
                  //           ],
                  //         )
                  //       ]),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: frameHeight / 15,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          // Add your onPressed code here!
                          Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 700),
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const NewLoan()));
                        },
                        label: const Text('New Loan'),
                        // icon: const Icon(Icons.forward),
                        backgroundColor: const Color(0xFF0096C7),
                      ),
                    ),
                  ),
                ])),
          ),
        ],
      ),
    ));
  }
}
