import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color(0xff2a2be8),
          Color(0xff5569e8),
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(90, 50),
        radius: 80,
      ));

    canvas.drawCircle(Offset(90, 50), 200, paint);

    paint.shader = null;
    paint.color = Color(0xff2a2be8);
    canvas.drawCircle(Offset(268, 30), 90, paint);
    canvas.drawCircle(Offset(350, 20), 40, paint);

    paint.color = Colors.white;
    canvas.drawCircle(Offset(315, -115), 100, paint);
    canvas.drawCircle(Offset(370, 160), 100, paint);

    final textSpan = TextSpan(children: [
      TextSpan(
        text: 'Welcome Back,\n',
        style: GoogleFonts.lato().copyWith(fontSize: 20, color: Colors.white),
      ),
      TextSpan(
        text: 'Log In!',
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left);
    textPainter.layout(minWidth: 0, maxWidth: 300);
    textPainter.paint(canvas, Offset(30, 40));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
