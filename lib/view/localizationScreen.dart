import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class Screenfour extends StatefulWidget {
  const Screenfour({super.key});

  @override
  State<Screenfour> createState() => _ScreenfourState();
}

class _ScreenfourState extends State<Screenfour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Tutorials'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('en', 'US'));
                  },
                  child: const Text('English')),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(onPressed: () {}, child: const Text('Urdu')),
            ],
          )
        ],
      ),
    );
  }
}
