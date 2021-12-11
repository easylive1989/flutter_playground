import 'package:flutter/material.dart';
import 'package:flutter_playground/research/notification/my_notification.dart';

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

class MyNotificationWidget extends StatelessWidget {
  const MyNotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: NotificationListener<MyNotification>(
          onNotification: (notification) {
            print("Receive notification outside");
            return true;
          },
          child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              print("Receive notification inside");
              return true;
            },
            child: Builder(
              builder: (context) {
                return TextButton(
                  child: Text("Click me"),
                  onPressed: () {
                    MyNotification().dispatch(context);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
