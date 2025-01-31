import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomAnnimatedAuthContainer extends StatelessWidget {
  final double height;
  const CustomAnnimatedAuthContainer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.vertical(
              bottom:
                  Radius.elliptical(MediaQuery.of(context).size.width, 120.0))),
      child: Padding(
        padding: EdgeInsets.only(bottom: SizeConfig.height15),
        child: Center(
          child: Image.asset(
            'assets/images/doorwayLogo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
