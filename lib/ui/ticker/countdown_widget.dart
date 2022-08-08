import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CountdownWidget extends StatelessWidget {
  CountdownWidget({Key? key}) : super(key: key);

  final DateTime startTime = DateTime.now().add(Duration(hours: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return TimerCountdownText(startTime: startTime);
          },
        ),
      ),
    );
  }
}

class TimerCountdownText extends StatefulWidget {
  const TimerCountdownText({Key? key, required this.startTime})
      : super(key: key);

  final DateTime startTime;

  @override
  State<TimerCountdownText> createState() => _TimerCountdownTextState();
}

class _TimerCountdownTextState extends State<TimerCountdownText> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("${widget.startTime.difference(DateTime.now())}"));
  }
}

class CountdownText extends StatefulWidget {
  const CountdownText({
    Key? key,
    required this.startTime,
  }) : super(key: key);

  final DateTime startTime;

  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText>
    with TickerProviderStateMixin {
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((duration) => setState(() {}));
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("${widget.startTime.difference(DateTime.now())}"));
  }
}
