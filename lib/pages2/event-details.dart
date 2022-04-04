import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
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
        backgroundColor: const Color(0xFF0096C7),
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
              // backgroundColor: Color(0xFF8B5E34),
              child: Icon(
                CupertinoIcons.chevron_back,
                color: Colors.white,
                // size: 20.0,
              ),
            ),
          ),
        ),
        title: const Text('Event Details',
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
          //             child: Text('My Event Details ',
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
          //         //   child: const Icon(Icons.add), Color(0xFF6F4518),
          //         // ),
          //       ])),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Column(children: [
                Card(
                  // color: Color(0XFF8b5e34),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Column(children: const [
                    Text('Event Note',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                          'Am planning to a research on my new business that i want to launch, to have more details on how others are doing it',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0)),
                    ),
                    
                  ]),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:24.0, top: 8.0, bottom: 8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start ,children: [Text('Shopping List ',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                // background: Paint()
                                //   ..color =
                                //       const Color.fromARGB(255, 118, 192, 121)
                                //   ..strokeWidth = 20
                                //   ..strokeJoin = StrokeJoin.round
                                //   ..strokeCap = StrokeCap.round
                                //   ..style = PaintingStyle.stroke,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0)),],),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: 20,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Card(
                          // color:Color(0XFF8b5e34),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Item ${(i + 1).toString().padLeft(2, '0')}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    const Text('09-09-2022')
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Unit : 4'),
                                    Text(
                                        'Tsh ${myFormat.format(3000000)}')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    ));
  }
}
