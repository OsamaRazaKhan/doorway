import 'package:doorway/controller/counter_controller.dart';
import 'package:doorway/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counterexample extends StatefulWidget {
  const Counterexample({super.key});

  @override
  State<Counterexample> createState() => _CounterexampleState();
}

class _CounterexampleState extends State<Counterexample> {
  final CounterController controller = Get.put(CounterController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<LoginViewModel>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx tutorials'),
      ),
      body: Center(
        child: Obx(() {
          return Text(
            controller.counter.toString(),
            style: const TextStyle(fontSize: 60),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.incrementCounter();
      }),
    );
  }
}
