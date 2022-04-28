import 'package:flutter/material.dart';
class budgetDetails extends StatefulWidget {
  const budgetDetails({ Key? key }) : super(key: key);

  @override
  State<budgetDetails> createState() => _budgetDetailsState();
}

class _budgetDetailsState extends State<budgetDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Expanded(
      child: Text('hello 1'),
      ),
      Expanded(
      flex: 2,
      child: Text('hello 2'),
      ),
      ],
    )
      ]),
    );
  }
}