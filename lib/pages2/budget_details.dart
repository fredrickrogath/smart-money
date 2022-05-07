import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class budgetDetails extends StatefulWidget {
  const budgetDetails({Key? key}) : super(key: key);

  @override
  State<budgetDetails> createState() => _budgetDetailsState();
}

class _budgetDetailsState extends State<budgetDetails> {
  final ScrollController _scrollController = ScrollController();
  double frameHeight = 0;
  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: frameHeight / 13,
        backgroundColor: const Color(0xFF0096C7),
        // automaticallyImplyLeading: false,
        title: Column(
          children: const [
            Text('My budgets',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPercentIndicator(
                  animationDuration: 2000,
                  animation: true,
                  radius: 60.0,
                  lineWidth: 8.0,
                  percent: 0.9,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Saving"), Text("Tsh 4000")],
                  ),
                  progressColor: Colors.green,
                ),
                CircularPercentIndicator(
                  animation: true,
                  radius: 60.0,
                  lineWidth: 8.0,
                  percent: 0.08,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Budget Spent"), Text("8%")],
                  ),
                  progressColor: Colors.red,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: 70,
                    width: 180,
                    child: Card(
                        elevation: 2.0,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [Text('Income spent'), Text('6.7%')],
                        )))),
                SizedBox(
                    height: 70,
                    width: 180,
                    child: Card(
                        elevation: 2.0,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Remainig to spent'),
                            Text('Tsh 1,230,000')
                          ],
                        )))),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: 70,
                  width: 180,
                  child: Card(
                      elevation: 2.0,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Total expenditure'),
                          Text('Tsh 730,000')
                        ],
                      )))),
              SizedBox(
                  height: 70,
                  width: 180,
                  child: Card(
                      elevation: 2.0,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Total budgeted'),
                          Text('Tsh 1,230,000')
                        ],
                      )))),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15.0),
          //   child: SizedBox(
          //       height: 70,
          //       width: 300,
          //       child: Card(
          //           elevation: 2.0,
          //           child: Center(
          //               child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: const [
          //               Text('Net disposable income'),
          //               Text('Tsh 1,230,000')
          //             ],
          //           )))),
          // ),
          const ExpansionTile(
            title: Text('Net disposable income'),
            subtitle: Text('Tsh 1,230,000'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text('This is tile number 3')),
            ],
          ),
          ExpansionTile(
            title: const Text('Total expenditure'),
            subtitle: const Text('Tsh 730,000'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      // controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Daily Living',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Text('Budget Spent',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text('Tsh 730,000'),
                                    )
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('Budget Spent',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text('Tsh 730,000'),
                                    )
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('Budget Spent',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text('Tsh 730,000'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    animation: true,
                                    lineHeight: 15.0,
                                    animationDuration: 2500,
                                    percent: 0.8,
                                    center: const Text("80.0%"),
                                    barRadius: const Radius.elliptical(30, 30),
                                    // linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }))
            ],
          ),
        ]),
      ),
    );
  }
}
