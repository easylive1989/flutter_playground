import 'package:flutter/material.dart';

class UserInfoButton extends StatelessWidget {
  final String text;

  const UserInfoButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
        ),
      ),
    );
  }
}