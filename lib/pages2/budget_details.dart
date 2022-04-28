import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class budgetDetails extends StatefulWidget {
  const budgetDetails({Key? key}) : super(key: key);

  @override
  State<budgetDetails> createState() => _budgetDetailsState();
}

class _budgetDetailsState extends State<budgetDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: SizedBox(
                height: 70,
                width: 300,
                child: Card(
                    elevation: 2.0,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Net disposable income'),
                        Text('Tsh 1,230,000')
                      ],
                    )))),
          ),
          const ExpansionTile(
            title: Text('Net disposable income'),
            subtitle: Text('Tsh 1,230,000'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              // ListTile(title: Text('This is tile number 3')),
            ],
          ),
          const ExpansionTile(
            title: Text('Total expenditure'),
            subtitle: Text('Tsh 730,000'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              // ListTile(leading: Text('Salary/Wages'),trailing: Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: const [Padding(
              //     padding: EdgeInsets.only(right:8.0),
              //     child: Text('Tsh 20,000'),
              //   ),
              // Icon(
              //     CupertinoIcons.tag,
              //     // color: Colors.white,
              //     // size: 36.0,
              //   ),
              // ],)),
            ],
          ),
        ]),
      ),
    );
  }
}
