import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomChangeContainerLocation extends StatelessWidget {
  const CustomChangeContainerLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width15, vertical: SizeConfig.height8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryColor,
      ),
      child: const CustomGoogleFontText(
        text: 'Change',
        size: 14,
        color: Colors.white,
      ),
    );
  }
}
