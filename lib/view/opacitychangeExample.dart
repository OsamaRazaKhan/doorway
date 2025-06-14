import 'package:doorway/controller/exampleTwo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OpacityChangeExample extends StatefulWidget {
  const OpacityChangeExample({super.key});

  @override
  State<OpacityChangeExample> createState() => _OpacityChangeExampleState();
}

class _OpacityChangeExampleState extends State<OpacityChangeExample> {
  final ExampletwoController controller = Get.put(ExampletwoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.1),
        child: Column(
          children: [
            Obx(() => Container(
                  height: 200,
                  width: 200,
                  color: Colors.red.withOpacity(
                    controller.opacity.value,
                  ),
                )),
            Obx(() => Slider(
                  value: controller.opacity.value,
                  onChanged: (value) {
                    controller.setOPacity(value);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
