import 'package:doorway/res/routes/routes.dart';
import 'package:doorway/res/getx_localization/languages.dart';
import 'package:doorway/view/login_view.dart';
import 'package:doorway/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      locale: const Locale('en', 'US'),
      translations: Languages(),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
