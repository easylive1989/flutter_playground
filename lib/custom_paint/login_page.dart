import 'package:flutter/material.dart';
import 'package:flutter_playground/custom_paint/login_painter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return CustomPaint(
          size: Size(constraint.maxWidth, constraint.maxHeight),
          painter: LoginPainter(),
        );
      },
    );
  }
}
