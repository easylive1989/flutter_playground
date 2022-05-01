import 'package:flutter/material.dart';

class UserTag extends StatelessWidget {
  final IconData icon;
  final String value;

  const UserTag({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.lightBlue),
        Text(value),
      ],
    );
  }
}