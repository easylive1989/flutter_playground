import 'dart:math';

import 'package:flutter/material.dart';

class KeyListWidget extends StatefulWidget {
  const KeyListWidget({Key? key}) : super(key: key);

  @override
  _KeyListWidgetState createState() => _KeyListWidgetState();
}

class _KeyListWidgetState extends State<KeyListWidget> {
  bool wrapColor = false;
  final int count = 10;
  final bool withKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => setState(() {
              wrapColor = !wrapColor;
            }),
            child: Text("Refresh"),
          ),
          if (wrapColor)
            ..._stateCustomTileList(count, withKey)
                .map((e) => Container(
                      child: e,
                      color: _randomColor,
                    ))
                .toList(),
          if (!wrapColor) ..._stateCustomTileList(count, withKey),
        ],
      ),
    );
  }

  Color get _randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  List<Widget> _stateCustomTileList(int count, bool withKey) {
    return List.generate(count, (index) => index).map(
      (index) {
        if (withKey) {
          return StateListTile(index: index, key: ValueKey(index));
        }
        return StateListTile(index: index);
      },
    ).toList();
  }

  List<Widget> _noStateTileList(int count, bool withKey) {
    return List.generate(count, (index) => index).map(
      (index) {
        if (withKey) {
          return ListTile(
            title: Text(
                "$index ${Random().nextInt(100)} widget:(${identityHashCode(this)}) element:(${identityHashCode(context)})"),
            key: ValueKey(index),
          );
        }
        return ListTile(
            title: Text(
                "$index ${Random().nextInt(100)} widget:(${identityHashCode(this)}) element:(${identityHashCode(context)})"));
      },
    ).toList();
  }

  List<Widget> _noStateCustomTileList(int count, bool withKey) {
    return List.generate(count, (index) => index).map(
      (index) {
        if (withKey) {
          return NoStateListTile(index: index, key: ValueKey(index));
        }
        return NoStateListTile(index: index);
      },
    ).toList();
  }
}

class NoStateListTile extends StatelessWidget {
  final int index;

  const NoStateListTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
            "$index ${Random().nextInt(100)} widget:(${identityHashCode(this)}) element:(${identityHashCode(context)})"));
  }
}

class StateListTile extends StatefulWidget {
  final int index;

  const StateListTile({Key? key, required this.index}) : super(key: key);

  @override
  _StateListTileState createState() => _StateListTileState();
}

class _StateListTileState extends State<StateListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
            "${widget.index} ${Random().nextInt(100)} widget:(${identityHashCode(this)}) element:(${identityHashCode(context)})"));
  }
}
