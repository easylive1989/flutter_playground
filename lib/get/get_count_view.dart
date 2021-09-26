import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_controller.dart';

class GetCountView extends GetView<CountController> {
  GetCountView({Key? key}) : super(key: key) {
    Get.put(CountController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter With Get"),
      ),
      body: Obx(() {
        return Column(
          children: [
            Text(
              'count: ${controller.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'count: ${controller.notUsed}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        );
      }),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              controller.notUse();
            },
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
