import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

void drawMultipleShape() {
  ContainerLayer containerLayer = ContainerLayer();
  PaintingContext paintingContext = PaintingContext(containerLayer, Rect.zero);

  Paint circle1Paint = Paint();
  circle1Paint.color = Colors.blue;

  // 注释1
  // paintingContext.canvas.save();

  // 对画布进行裁剪
  //
  paintingContext.canvas.clipRect(
    Rect.fromCenter(center: Offset(400, 400), width: 280, height: 600),
  );

  // 在裁剪后的画布上画一个⭕️
  //
  paintingContext.canvas.drawCircle(Offset(400, 400), 300, circle1Paint);

  // 注释2
  // paintingContext.canvas.restore();

  void _painter(PaintingContext context, Offset offset) {
    Paint circle2Paint = Paint();
    circle2Paint.color = Colors.red;
    context.canvas.drawCircle(Offset(400, 400), 250, circle2Paint);
  }

  // 通过 pushClipRect 方法再次执行裁剪
  // 注意此处 needsCompositing 参数为 true
  //
  paintingContext.pushClipRect(
    false,
    Offset.zero,
    Rect.fromCenter(center: Offset(500, 400), width: 200, height: 200),
    _painter,
  );

  Paint circle3Paint = Paint();
  circle3Paint.color = Colors.yellow;

  // 再次画一个⭕️
  //
  paintingContext.canvas.drawCircle(
    Offset(400, 800),
    300,
    circle3Paint,
  );
  paintingContext.stopRecordingIfNeeded();

  // 为了减少篇幅，生成 Scene 相关的代码已省略

  //
  Scene scene = containerLayer.buildScene(SceneBuilder());

  window.onDrawFrame = () {
    // 将 scene 送入 Engine 层进行渲染显示
    //
    window.render(scene);
  };
  window.scheduleFrame();
}

void drawCircle() {
  PictureRecorder recorder = PictureRecorder();
  Canvas canvas = Canvas(recorder);

  Paint circlePaint = Paint();
  circlePaint.color = Colors.blue;
  canvas.drawCircle(Offset(400, 400), 300, circlePaint);

  Picture picture = recorder.endRecording();

  SceneBuilder sceneBuilder = SceneBuilder();
  sceneBuilder.addPicture(Offset(0, 0), picture);

  Scene scene = sceneBuilder.build();
  window.onDrawFrame = () {
    window.render(scene);
  };
  window.scheduleFrame();
}

void drawLogin() {
  PictureRecorder recorder = PictureRecorder();
  Canvas canvas = Canvas(recorder);

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

  paint.color = Colors.black;
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

  Picture picture = recorder.endRecording();

  SceneBuilder sceneBuilder = SceneBuilder();
  sceneBuilder.addPicture(Offset(0, 0), picture);

  Scene scene = sceneBuilder.build();
  window.onDrawFrame = () {
    window.render(scene);
  };
  window.scheduleFrame();
}
