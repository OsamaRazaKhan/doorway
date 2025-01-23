import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomRewardsThirdBlock extends StatelessWidget {
  const CustomRewardsThirdBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.width35),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/noreward1.PNG',
              fit: BoxFit.cover,
              height: SizeConfig.height40,
            ),
          ),
          title: const CustomGoogleFontText(
            text: 'Earn bars every time you pay for services',
            size: 14,
            color: Colors.black,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.width35),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/noreward2.PNG',
              fit: BoxFit.cover,
              height: SizeConfig.height40,
            ),
          ),
          title: const CustomGoogleFontText(
            text:
                'Use your points to give back to those in needs,order a service-your bars,your choice!',
            size: 14,
            color: Colors.black,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.width35),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/noreward3.PNG',
              fit: BoxFit.cover,
              height: SizeConfig.height40,
            ),
          ),
          title: const CustomGoogleFontText(
            text: 'Earn bars every time you pay for services',
            size: 14,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
