import 'package:flutter/material.dart';

class StackSize extends StatelessWidget {
  const StackSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Expanded(
                    //   child: ListView(
                    //     children: [
                    //       Container(
                    //         color: Colors.red,
                    //         height: 50,
                    //         width: 50,
                    //       ),
                    //       Container(
                    //         color: Colors.black,
                    //         height: 100,
                    //         width: 100,
                    //       ),
                    //     ],
                    //   ),
                    // )
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.red,
                              height: 50,
                              width: 50,
                            ),
                            Container(
                              color: Colors.black,
                              height: 100,
                              width: 100,
                            ),
                            Container(
                              color: Colors.black,
                              height: 100,
                              width: 100,
                            ),
                            Container(
                              color: Colors.black,
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              child: Container(
                color: Colors.blue,
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
