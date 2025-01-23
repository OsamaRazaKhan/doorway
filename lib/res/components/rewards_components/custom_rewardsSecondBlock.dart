import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomRewardsSecondBlock extends StatelessWidget {
  const CustomRewardsSecondBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.width40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.height20,
          ),
          CustomGoogleFontText(
            text: 'How it works?',
            fontWeight: FontWeight.bold,
            size: SizeConfig.width16,
          ),
          CustomGoogleFontText(
            text: 'Getting rewards with DoorWay is super easy!',
            size: SizeConfig.width13,
          ),
        ],
      ),
    );
  }
}
