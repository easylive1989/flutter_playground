import 'package:get/get.dart';

class CountController extends GetxController {
  final RxInt count = 0.obs;
  final RxBool notUsed = false.obs;

  increase() {
    count.value++;
  }

  notUse() {
    notUsed.value = !notUsed.value;
  }
}
