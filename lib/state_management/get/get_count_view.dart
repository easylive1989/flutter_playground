import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetCountView extends StatelessWidget {
  final RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Text('count: ${count.value}');
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => count.value++,
        child: Icon(Icons.add),
      ),
    );
  }
}
