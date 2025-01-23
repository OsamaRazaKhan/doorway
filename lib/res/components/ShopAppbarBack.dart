import 'package:doorway/res/color.dart';
import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';
import 'CustomGoogleFontText.dart';

AppBar shopAppbarBack(String title, BuildContext context,
    {bool isBackEnable = true, Color? appBarColor}) {
  return AppBar(
    backgroundColor: AppColors.appbarColor,
    leading: InkWell(
      onTap: isBackEnable
          ? () {
              Navigator.pop(context);
            }
          : () {},
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
    elevation: 0.0,
    automaticallyImplyLeading: true,
    title: CustomGoogleFontText(
      text: title,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      size: SizeConfig.width20,
    ),
    centerTitle: true,
  );
}
