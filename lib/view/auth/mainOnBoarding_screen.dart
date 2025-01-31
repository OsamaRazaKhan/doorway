import 'package:doorway/res/components/authenticationGlobal_components/custom_annimatedAuthContainer.dart';
import 'package:doorway/res/components/mainOnBoarding_components/custom_secondPortionOnBoarding.dart';
import 'package:flutter/material.dart';

class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainOnBoardingScreenState createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAnnimatedAuthContainer(
              height: MediaQuery.of(context).size.height / 1.9,
            ),
            const CustomSecondPortionOnBoarding(),
          ],
        ),
      ),
    );
  }
}
