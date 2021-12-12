import 'package:flutter/material.dart';

class ColumnFlex extends StatelessWidget {
  const ColumnFlex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(color: Colors.green, child: Text("Flex")),
            ),
            Expanded(
              child: Container(color: Colors.red),
            ),
            Container(height: 100, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Column buildFlexible() {
    return Column(
      children: [
        Flexible(
          child: Container(color: Colors.green, child: Text("Flex")),
        ),
        Flexible(
          child: Container(color: Colors.red),
        ),
        Container(height: 100, color: Colors.black),
      ],
    );
  }
}
