import 'package:flutter/material.dart';
import 'package:flutter_playground/common/data.dart';

class TextsInStack extends StatelessWidget {
  const TextsInStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned.directional(
            textDirection: TextDirection.ltr,
            child: Text(longStory1),
          ),
          Positioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(longStory2),
            ),
          ),
          Positioned.fill(
            bottom: 11,
            left: 10,
            right: 10,
            child: Align(
                alignment: Alignment.bottomCenter, child: Text(longStory3)),
          )
        ],
      ),
    );
  }
}
