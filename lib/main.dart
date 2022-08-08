import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/dependencies/http/web_content_widget.dart';
import 'package:flutter_playground/hello_world.dart';
import 'package:flutter_playground/research/key_performance/key_list_widget.dart';
import 'package:flutter_playground/research/notification/notification_counter.dart';
import 'package:flutter_playground/research/stack_size/stack_size.dart';
import 'package:flutter_playground/state_management/bloc/counter_with_bloc.dart';
import 'package:flutter_playground/state_management/bloc/counter_with_multi_bloc.dart';
import 'package:flutter_playground/state_management/get/get_count_view.dart';
import 'package:flutter_playground/state_management/provider/counter_with_provider.dart';
import 'package:flutter_playground/ui/custom_child_layout/complicated_item.dart';
import 'package:flutter_playground/ui/custom_paint/login_page.dart';
import 'package:flutter_playground/ui/flex/column_flex.dart';
import 'package:flutter_playground/ui/lottie/lottie_example_widget.dart';
import 'package:flutter_playground/ui/overlay/floating_widget_example.dart';
import 'package:flutter_playground/ui/scroll/bottom_card.dart';
import 'package:flutter_playground/ui/sliver/sliver_page.dart';
import 'package:flutter_playground/ui/stack/texts_in_stack.dart';
import 'package:flutter_playground/ui/text_overflow/text_overflow_widget.dart';
import 'package:flutter_playground/ui/ticker/countdown_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
  // drawLogin();
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routeMap = {
    "/countdown": (context) => CountdownWidget(),
    "/stack-size": (context) => StackSize(),
    "/user-info": (context) => UserList(),
    "/Bottom_Scroll": (context) => BottomScrollExample(),
    "/Column_Flex": (context) => ColumnFlex(),
    "/KeyListWidget": (context) => KeyListWidget(),
    "/FloatingWidget": (context) => OverlayFloatingWidget(),
    "/Get": (context) => GetCountView(),
    "/Notification": (context) => MyNotificationWidget(),
    "/Stack": (context) => TextsInStack(),
    "/Login": (context) => LoginPage(),
    "/Silver": (context) => SliverPage(),
    "/Http": (context) => WebContentWidget(),
    "/Bloc": (context) => CounterWithBloc(),
    "/Provider": (context) => CounterWithProvider(),
    "/Multi_Bloc": (context) => CounterWithMultiBloc(),
    "/Lottie": (context) => LottieExampleWidget(),
    "/Text_Overflow": (context) => TextOverflowWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => HelloWorld(routeNames: _routeMap.keys.toList()),
        ..._routeMap,
      },
    );
  }
}
