import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.red,
        height: Get.height * 0.8,
        width: Get.width * 0.8,
      ),
    );
  }
}
