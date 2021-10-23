import 'package:flutter/material.dart';

class ParentStatefulWidget extends StatefulWidget {
  const ParentStatefulWidget({Key? key}) : super(key: key);

  @override
  _ParentStatefulWidgetState createState() => _ParentStatefulWidgetState();
}

class _ParentStatefulWidgetState extends State<ParentStatefulWidget> {
  Color _color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Column(
        children: [
          ChildStatefulWidget(
            key: ValueKey(1),
          ),
          TextButton(
            child: Text("click me"),
            onPressed: () {
              setState(() {
                _color = _color == Colors.purple ? Colors.red : Colors.purple;
              });
            },
          ),
          TextButton(
            child: Text("push"),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed("/Get");
              });
            },
          ),
          TextButton(
            child: Text("pop and push"),
            onPressed: () {
              setState(() {
                Navigator.of(context).popAndPushNamed("/Get");
              });
            },
          ),
        ],
      ),
    );
  }
}

class ChildStatefulWidget extends StatefulWidget {
  const ChildStatefulWidget({Key? key}) : super(key: key);

  @override
  _ChildStatefulWidgetState createState() => _ChildStatefulWidgetState();
}

class _ChildStatefulWidgetState extends State<ChildStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
      color: Colors.green,
      width: 100,
      height: 100,
    );
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  @override
  void didUpdateWidget(ChildStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
