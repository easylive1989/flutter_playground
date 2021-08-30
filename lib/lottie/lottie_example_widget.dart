import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExampleWidget extends StatelessWidget {
  const LottieExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Load a Lottie file from your assets
        Lottie.asset('assets/71696-dolphin.json'),

        // Load a Lottie file from a remote url
        Lottie.network(
            'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

        // Load an animation and its images from a zip file
        Lottie.asset('assets/71696-dolphin.zip'),
      ],
    );
  }
}
