import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  final List<String> routeNames;

  HelloWorld({required this.routeNames});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: routeNames.length,
          itemBuilder: (context, index) {
            return TextButton(
                child: Text(routeNames[index]),
                onPressed: () =>
                    Navigator.of(context).pushNamed(routeNames[index]));
          },
        ),
      ),
    );
  }
}
