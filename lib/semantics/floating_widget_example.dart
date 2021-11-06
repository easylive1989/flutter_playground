import 'package:flutter/material.dart';

class MyContentWidget extends StatelessWidget {
  const MyContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Widget Example")),
      body: Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              StackFloatingWidget.of(context).show(
                Card(
                  elevation: 5.0,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("My Floating Widget")),
                  color: Colors.blue,
                ),
              );
            },
            child: Text("Click Me"),
          );
        },
      ),
    );
  }
}

class StackFloatingWidget extends StatefulWidget {
  final Widget child;

  const StackFloatingWidget({Key? key, required this.child}) : super(key: key);

  @override
  StackFloatingWidgetState createState() => StackFloatingWidgetState();

  static StackFloatingWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<StackFloatingWidgetState>()!;
  }
}

class StackFloatingWidgetState extends State<StackFloatingWidget> {
  Widget? _floatingWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_floatingWidget != null)
          Center(
            child: _floatingWidget,
          ),
      ],
    );
  }

  void show(Widget child) {
    setState(() {
      _floatingWidget = child;
    });
  }
}

class OverlayFloatingWidget extends StatelessWidget {
  final OverlayEntry _overlayEntry = OverlayEntry(
    builder: (context) {
      return Center(
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text("My Floating Widget"),
          ),
          color: Colors.blue,
        ),
      );
    },
  );

  OverlayFloatingWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Widget Example")),
      body: Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              if (_overlayEntry.mounted) {
                _overlayEntry.remove();
              } else {
                Overlay.of(context)!.insert(_overlayEntry);
              }
            },
            child: Text("Click Me"),
          );
        },
      ),
    );
  }
}

class CustomLayoutFloatingWidget extends StatefulWidget {
  const CustomLayoutFloatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CustomLayoutFloatingWidgetState createState() =>
      _CustomLayoutFloatingWidgetState();
}

class _CustomLayoutFloatingWidgetState
    extends State<CustomLayoutFloatingWidget> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: FloatingDelegate(show),
      children: [
        LayoutId(
          id: "main",
          child: Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                child: Text("Floating Widget Example"),
                onTap: () {
                  setState(() {
                    show = !show;
                  });
                },
              ),
            ),
            body: Container(),
          ),
        ),
        if (show)
          LayoutId(
            id: "toast",
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Hello World\nHello World\nHello World"),
              ),
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}

class FloatingDelegate extends MultiChildLayoutDelegate {
  final bool show;

  FloatingDelegate(this.show);

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = BoxConstraints(
      minWidth: 0.0,
      maxWidth: size.width,
      minHeight: 0.0,
      maxHeight: size.height,
    );
    layoutChild("main", constraints);
    positionChild("main", Offset(0, 0));

    if (show) {
      layoutChild("toast", constraints);
      positionChild("toast", Offset(size.width - 150, 30));
    }
  }

  @override
  bool shouldRelayout(covariant FloatingDelegate oldDelegate) {
    return oldDelegate.show != show;
  }
}
