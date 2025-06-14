import 'package:doorway/view/screenTwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  Get.toNamed('/screenTwo', arguments: [
                    'osama raza',
                    'This is my name',
                  ]);
                },
                child: const Text('move to screen 2')),
          )
        ],
      ),
    );
  }
}
