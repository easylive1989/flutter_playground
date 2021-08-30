import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_playground/bloc/counter_with_bloc.dart';
import 'package:flutter_playground/bloc/counter_with_multi_bloc.dart';
import 'package:flutter_playground/custom_paint/login_page.dart';
import 'package:flutter_playground/http/web_content_widget.dart';
import 'package:flutter_playground/lottie/lottie_example_widget.dart';
import 'package:flutter_playground/network_image_list/network_image_list.dart';
import 'package:flutter_playground/provider/counter_with_provider.dart';
import 'package:flutter_playground/sliver/sliver_page.dart';
import 'package:flutter_playground/text_overflow/text_overflow_widget.dart';

import 'column_build/column_build.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class WidgetMap {
  Widget button;
  Widget page;

  WidgetMap(this.button, this.page);
}

class _MyAppState extends State<MyApp> {
  Map<Key, WidgetMap> _widgetMap = {};
  late Key currentKey;

  @override
  void initState() {
    super.initState();
    _addPage("Login", LoginPage());
    _addPage("Silver", SliverPage());
    _addPage("Http", WebContentWidget());
    _addPage("Bloc", CounterWithBloc());
    _addPage("Provider", CounterWithProvider());
    _addPage("Multi Bloc", CounterWithMultiBloc());
    _addPage("Network Image", NetworkImageList());
    _addPage("Column Rebuild", ColumnBuild());
    _addPage("Lottie", LottieExampleWidget());
    _addPage("Text Overflow", TextOverflowWidget());

    currentKey = _widgetMap.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _widgetMap.values.map((e) => e.button).toList(),
                ),
              ),
              Expanded(
                child: _buildPage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addPage(String title, Widget widget) {
    var buildButton = _buildButton(title);
    _widgetMap[buildButton.key!] = WidgetMap(buildButton, widget);
  }

  Widget _buildPage() {
    if (_widgetMap.containsKey(currentKey)) {
      return _widgetMap[currentKey]!.page;
    }
    return Container();
  }

  Widget _buildButton(String title) {
    var valueKey = ValueKey(title);
    var textButton = TextButton(
      key: valueKey,
      child: Text(title),
      onPressed: () => setState(() {
        this.currentKey = valueKey;
      }),
    );
    return textButton;
  }
}
