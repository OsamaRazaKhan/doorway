import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<String> fruitList = ['Orange', 'Apple', 'Mangoes', 'Bananas'].obs;
  RxList tempFruitList = [].obs;

  addTofavourite(String value) {
    tempFruitList.add(value);
  }

  remvoeFromFavourite(String value) {
    tempFruitList.remove(value);
  }
}
