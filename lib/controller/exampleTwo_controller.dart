import 'package:get/get.dart';

class ExampletwoController extends GetxController {
  RxDouble opacity = 0.4.obs;

  setOPacity(double value) {
    opacity.value = value;
  }
}
