import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartmoney/pages2/event-details.dart';

class Payer extends StatefulWidget {
  const Payer({Key? key}) : super(key: key);

  @override
  State<Payer> createState() => _PayerState();
}

class _PayerState extends State<Payer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF6F4518),
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
              backgroundColor: Color(0xFF8B5E34),
              child: Icon(
                CupertinoIcons.chevron_back,
                color: Colors.white,
                // size: 20.0,
              ),
            ),
          ),
        ),
        title: const Text('Payer', style: TextStyle(fontSize: 20.0)),
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
                    transitionDuration: const Duration(milliseconds: 1000),
                    openBuilder: (context, action) {
                      return const EventDetails();
                    },
                    closedBuilder: (context, action) {
                      return Card(
                        // color:Color(0XFF8b5e34),
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                    child: Column(children: [Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Name : Thomas', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400,)),],),
                    ),Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Interest : 5%'), Text('Loan : 100,000')],),
                    ),],),
                  );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton.extended(
                        onPressed: () {},
                        label: const Text('New Loan'),
                        // icon: const Icon(Icons.add),
                        backgroundColor: Color(0xFF6F4518),
                      ),
    ));
  }
}