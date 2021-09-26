import 'package:flutter/material.dart';
import 'package:flutter_playground/custom_paint/login_painter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRect(
        child: Align(
          child: CustomPaint(
            size: Size(500, 500),
            painter: LoginPainter(),
          ),
        ),
      ),
    );
  }
}
