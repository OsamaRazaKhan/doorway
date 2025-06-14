import 'package:doorway/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final FavouriteController controller = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: controller.fruitList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  onTap: () {
                    if (controller.tempFruitList
                        .contains(controller.fruitList[index].toString())) {
                      controller.remvoeFromFavourite(
                          controller.fruitList[index].toString());
                    } else {
                      controller.addTofavourite(
                          controller.fruitList[index].toString());
                    }
                  },
                  title: Text(controller.fruitList[index].toString()),
                  trailing: Obx(
                    () => Icon(
                      Icons.favorite,
                      color: controller.tempFruitList
                              .contains(controller.fruitList[index].toString())
                          ? Colors.red
                          : Colors.white,
                    ),
                  )),
            );
          }),
    );
  }
}
