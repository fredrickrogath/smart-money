// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class NewBudget extends StatefulWidget {
//   const NewBudget({Key? key}) : super(key: key);

//   @override
//   State<NewBudget> createState() => _NewBudgetState();
// }

// class _NewBudgetState extends State<NewBudget> {
//   double frameHeight = 0;
//   double frameWidth = 0;
//   @override
//   Widget build(BuildContext context) {
//     frameHeight = MediaQuery.of(context).size.height;
//     frameWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 120.0,
//           leadingWidth: 250.0,
//           leading: SizedBox(
//             // padding: const EdgeInsets.all(8.0),
//             width: 500.0,
//             // height: 20.0,
//             child: Stack(
//               children: const <Widget>[
//                 //Change according to your icon
//                 Positioned(
//                   left: -50,
//                   top: -30.0,
//                   child: Icon(
//                     CupertinoIcons.circle_fill,
//                     size: 150.0,
//                     color: Colors.red,
//                   ),
//                 ),
//                 Positioned(
//                   left: 10.0,
//                   top: -50.0,
//                   //Change according to your icon
//                   child: Icon(
//                     CupertinoIcons.circle_fill,
//                     size: 130.0,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             SizedBox(height: frameHeight / 20),
//            const Text('Sjui ni picha gani',
//                 style: TextStyle(fontSize: 20.0, backgroundColor: Colors.red)),
//             SizedBox(height: frameHeight / 20),
//             SizedBox(
//               height: frameHeight / 26,
//               // width: frameWidth / 3.0,
//               child: FloatingActionButton.extended(
//                   elevation: 0.0,
//                   foregroundColor: Colors.white,
//                   backgroundColor: const Color(0xFF6F4518), 
//                   onPressed: () {
//                     // final isAdded = context
//                     //     .read<CartDisplay>()
//                     //     .getItemList
//                     //     .any((element) => element.id == 16);

//                     // isAdded == true
//                     //     ? context
//                     //         .read<CartDisplay>()
//                     //         .getItemList
//                     //         .firstWhere((element) =>
//                     //             element.count++)
//                     //     :

//                     // context.read<CartDisplay>().increment();

//                     // addedToCart.add(_item.id);
//                   },
//                   label: Row(children: const [
//                     Icon(
//                       Icons.add,
//                       size: 22.0,
//                     ),
//                     Text('Create New Budget',
//                         style: TextStyle(
//                             // fontWeight: FontWeight.bold,
//                             fontSize: 14.0,
//                             color: Colors.white))
//                   ])),
//             ),
//             SizedBox(height: frameHeight / 35.0),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children:const [
//                  Text('Budget List', style: TextStyle(fontSize: 16.0)),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 physics: const AlwaysScrollableScrollPhysics(
//                     parent: BouncingScrollPhysics()),
//                 itemCount: 6,
//                 itemBuilder: (context, i) {
//                   return Container(
//                     child: const Card(
//                       elevation: 2.0,
                      
//                       shape: Border(
//                           left: BorderSide(color: Colors.green, width: 5)),
//                       child: ListTile(
//                         // leading: ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //     elevation: 0.0,
//                         //     primary: const Color(0xFF8B5E34), // background
//                         //     onPrimary: Colors.white, // foreground
//                         //   ),
//                         //   onPressed: () {},
//                         //   child: const Text('Add'),
//                         // ),
//                         title: Text("Salaries/Wages"),
//                         subtitle: Text("little info on the budget"),
//                         trailing: Text('Tarehe flani',
//                             style: TextStyle(color: Colors.green)),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ));
//   }
// }
