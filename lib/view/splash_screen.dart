import 'package:doorway/res/assets/images/image_assets.dart';
import 'package:doorway/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: const Image(
        image: AssetImage(ImageAssets.splashScreen),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Utils.snackBar('Osama Raza', 'Osama Raza');
      }),
    );
  }
}
