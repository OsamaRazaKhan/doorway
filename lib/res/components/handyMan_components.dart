import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:flutter/material.dart';

Widget advantageDetails(BuildContext context,
    {required IconData iconData,
    required String title,
    required String subTitlte}) {
  return Container(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
    margin: const EdgeInsets.only(bottom: 10),
    alignment: Alignment.center,
    child: Row(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomGoogleFontText(
              text: title,
              size: SizeConfig.width15,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomGoogleFontText(
              text: subTitlte,
              size: SizeConfig.width11,
              color: Colors.black,
            ),
          ],
        )
      ],
    ),
  );
}

Widget typeCard(ServicesViewModel servicesViewModel,
    {required String title,
    required int index,
    required void Function()? onPress}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      width: SizeConfig.width150,
      height: SizeConfig.height100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: servicesViewModel.servicesList[index].isSelected!
            ? AppColors.primaryColor
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(3.0, 3.0),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomGoogleFontText(
            text: title,
            textAlign: TextAlign.center,
            size: SizeConfig.width16,
            fontWeight: FontWeight.bold,
            color: servicesViewModel.servicesList[index].isSelected!
                ? Colors.white
                : AppColors.primaryColor),
      ),
    ),
  );
}
