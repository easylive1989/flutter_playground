import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  final List<String> routeNames;

  HelloWorld({required this.routeNames});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: routeNames
                    .map((routeName) => TextButton(
                        child: Text(routeName),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(routeName)))
                    .toList(),
              ),
            ),
            Text("Hello Word")
          ],
        ),
      ),
    );
  }
}
