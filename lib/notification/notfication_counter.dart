import 'package:flutter/material.dart';
import 'package:flutter_playground/notification/my_notification.dart';

class NotificationCounter extends StatefulWidget {
  const NotificationCounter({Key? key}) : super(key: key);

  @override
  _NotificationCounterState createState() => _NotificationCounterState();
}

class _NotificationCounterState extends State<NotificationCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _count++;
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification Counter"),
        ),
        body: Text(
          'count: $_count',
          style: Theme.of(context).textTheme.headline4,
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                MyNotification().dispatch(context);
              },
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
