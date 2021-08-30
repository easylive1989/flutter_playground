import 'package:flutter/material.dart';

class ColumnBuild extends StatelessWidget {
  const ColumnBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColumnBuildChild(),
        ColumnBuildChild(),
        ColumnBuildChildStateless(),
      ],
    );
  }
}

class ColumnBuildChildStateless extends StatelessWidget {
  final VoidCallback? onPressed;

  const ColumnBuildChildStateless({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ColumnBuildChildStateless build");
    return Container(
      height: 50,
      child: onPressed == null
          ? Text("Can not click")
          : TextButton(onPressed: onPressed, child: Text("Click me")),
    );
  }
}

class ColumnBuildChild extends StatefulWidget {
  final VoidCallback? onPressed;

  const ColumnBuildChild({Key? key, this.onPressed}) : super(key: key);

  @override
  _ColumnBuildChildState createState() => _ColumnBuildChildState();
}

class _ColumnBuildChildState extends State<ColumnBuildChild> {
  double height = 50;

  @override
  Widget build(BuildContext context) {
    print("ColumnBuildChild build");
    return Container(
      height: height,
      child: TextButton(
        onPressed: widget.onPressed ??
            () {
              setState(() {
                height += 50;
              });
            },
        child: Text("Click me"),
      ),
    );
  }
}
