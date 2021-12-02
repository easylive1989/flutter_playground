import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/bloc/counter_with_bloc.dart';
import 'package:flutter_playground/bloc/counter_with_multi_bloc.dart';
import 'package:flutter_playground/card/card_list.dart';
import 'package:flutter_playground/custom_paint/login_page.dart';
import 'package:flutter_playground/get/get_count_view.dart';
import 'package:flutter_playground/hello_world.dart';
import 'package:flutter_playground/http/web_content_widget.dart';
import 'package:flutter_playground/key_performance/key_list_widget.dart';
import 'package:flutter_playground/lifecycle/my_stateful_widget.dart';
import 'package:flutter_playground/lottie/lottie_example_widget.dart';
import 'package:flutter_playground/network_image_list/network_image_list.dart';
import 'package:flutter_playground/provider/counter_with_provider.dart';
import 'package:flutter_playground/semantics/floating_widget_example.dart';
import 'package:flutter_playground/sliver/sliver_page.dart';
import 'package:flutter_playground/stack/texts_in_stack.dart';
import 'package:flutter_playground/text_overflow/text_overflow_widget.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import 'column_build/column_build.dart';
import 'notification/notification_counter.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  if (defaultTargetPlatform == TargetPlatform.android) {
    InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
  }
  runApp(MyApp());
  // drawLogin();
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
  Map<String, WidgetBuilder> _routeMap = {};

  @override
  void initState() {
    super.initState();
    _routeMap["/KeyListWidget"] = (context) => KeyListWidget();
    _routeMap["/FloatingWidget"] = (context) => OverlayFloatingWidget();
    _routeMap["/StatefulWidget"] = (context) => ParentStatefulWidget();
    _routeMap["/Get"] = (context) => GetCountView();
    _routeMap["/Notification"] = (context) => MyNotificationWidget();
    _routeMap["/Stack"] = (context) => TextsInStack();
    _routeMap["/Login"] = (context) => LoginPage();
    _routeMap["/Image Card"] = (context) => ImageCardList();
    _routeMap["/Silver"] = (context) => SliverPage();
    _routeMap["/Http"] = (context) => WebContentWidget();
    _routeMap["/Bloc"] = (context) => CounterWithBloc();
    _routeMap["/Provider"] = (context) => CounterWithProvider();
    _routeMap["/Multi_Bloc"] = (context) => CounterWithMultiBloc();
    _routeMap["/Network_Image"] = (context) => NetworkImageList();
    _routeMap["/Column_Rebuild"] = (context) => ColumnBuild();
    _routeMap["/Lottie"] = (context) => LottieExampleWidget();
    _routeMap["/Text_Overflow"] = (context) => TextOverflowWidget();
    _routeMap["/"] =
        (context) => HelloWorld(routeNames: _routeMap.keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routeMap,
    );
  }
}
