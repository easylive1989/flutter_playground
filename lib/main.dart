import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/dependencies/http/web_content_widget.dart';
import 'package:flutter_playground/hello_world.dart';
import 'package:flutter_playground/research/key_performance/key_list_widget.dart';
import 'package:flutter_playground/research/notification/notification_counter.dart';
import 'package:flutter_playground/state_management/bloc/counter_with_bloc.dart';
import 'package:flutter_playground/state_management/bloc/counter_with_multi_bloc.dart';
import 'package:flutter_playground/state_management/get/get_count_view.dart';
import 'package:flutter_playground/state_management/provider/counter_with_provider.dart';
import 'package:flutter_playground/ui/custom_paint/login_page.dart';
import 'package:flutter_playground/ui/lottie/lottie_example_widget.dart';
import 'package:flutter_playground/ui/overlay/floating_widget_example.dart';
import 'package:flutter_playground/ui/sliver/sliver_page.dart';
import 'package:flutter_playground/ui/stack/texts_in_stack.dart';
import 'package:flutter_playground/ui/text_overflow/text_overflow_widget.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

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

class _MyAppState extends State<MyApp> {
  Map<String, WidgetBuilder> _routeMap = {};

  @override
  void initState() {
    super.initState();
    _routeMap["/KeyListWidget"] = (context) => KeyListWidget();
    _routeMap["/FloatingWidget"] = (context) => OverlayFloatingWidget();
    _routeMap["/Get"] = (context) => GetCountView();
    _routeMap["/Notification"] = (context) => MyNotificationWidget();
    _routeMap["/Stack"] = (context) => TextsInStack();
    _routeMap["/Login"] = (context) => LoginPage();
    _routeMap["/Silver"] = (context) => SliverPage();
    _routeMap["/Http"] = (context) => WebContentWidget();
    _routeMap["/Bloc"] = (context) => CounterWithBloc();
    _routeMap["/Provider"] = (context) => CounterWithProvider();
    _routeMap["/Multi_Bloc"] = (context) => CounterWithMultiBloc();
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
