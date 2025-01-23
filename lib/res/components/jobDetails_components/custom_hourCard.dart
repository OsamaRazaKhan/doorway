import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';

class CustomSubServiceCard extends StatelessWidget {
  final SubServicesViewModel subServicesViewModel;
  final int index;
  final VoidCallback onTap;

  const CustomSubServiceCard({
    Key? key,
    required this.subServicesViewModel,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.width100,
        height: SizeConfig.height40,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.height10, horizontal: SizeConfig.width10),
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.height10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: subServicesViewModel.subServicesList[index].isSelected
              ? AppColors.primaryColor
              : Colors.white,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.0,
          ),
        ),
        child: CustomGoogleFontText(
          text: subServicesViewModel.subServicesList[index].title!,
          textAlign: TextAlign.center,
          color: subServicesViewModel.subServicesList[index].isSelected
              ? Colors.white
              : AppColors.primaryColor,
          size: SizeConfig.width14,
        ),
      ),
    );
  }
}
