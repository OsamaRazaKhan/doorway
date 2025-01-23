import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomRewardsFirstBlock extends StatelessWidget {
  const CustomRewardsFirstBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: SizedBox(
                height: SizeConfig.height140,
                width: SizeConfig.width190,
                child: Image.asset(
                  'assets/images/noReward.PNG',
                  fit: BoxFit.contain,
                ))),
        SizedBox(
          height: SizeConfig.height20,
        ),
        CustomGoogleFontText(
          text: "You don't have any",
          size: SizeConfig.width18,
          fontWeight: FontWeight.bold,
        ),
        CustomGoogleFontText(
          text: "rewards yet",
          size: SizeConfig.width18,
          fontWeight: FontWeight.bold,
        ),
        CustomGoogleFontText(
          text: 'All rewards given by service',
          size: SizeConfig.width14,
          color: Colors.black38,
        ),
        CustomGoogleFontText(
          text: 'providers will be listed here',
          size: SizeConfig.width14,
          color: Colors.black38,
        ),
      ],
    );
  }
}
