import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class outEntry extends StatefulWidget {
  const outEntry({ Key? key }) : super(key: key);

  @override
  State<outEntry> createState() => _outEntryState();
}

class _outEntryState extends State<outEntry> {
  final _controller = TextEditingController();

   double frameHeight = 0;
  double frameWidth = 0;


  @override
  Widget build(BuildContext context) {
    frameHeight = MediaQuery.of(context).size.height;
    frameWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Add Cash Out Entry'),),
      body: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 30),

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
                        hintText: 'Amount',
                      ),
                    ),
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Text(
                              
                  //             btnSubmit && !_controller.value.text.isNotEmpty
                  //                 ? 'Name can not be empty'
                  //                 : '',
                  //             style: const TextStyle(color: Colors.red)),
                  //       ],
                  //     )),


                
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: frameHeight / 17.0,
                      width: double.infinity,
                      child: FloatingActionButton.extended(
                        elevation: 0.0,
                        onPressed: () {
                          setState(() {});
                          if (_controller.value.text.isNotEmpty) {
                            
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         duration: const Duration(milliseconds: 700),
                            //         reverseDuration:
                            //             const Duration(milliseconds: 700),
                            //         type:
                            //             PageTransitionType.rightToLeftWithFade,
                            //         child: Welcome(name:_controller.text)));
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
          ),
    );
  }
}