import 'package:flutter/material.dart';
import '../../utils/SizeConfig.dart';
import 'CustomGoogleFontText.dart';

AppBar shopAppbarBack(String? title, BuildContext context,
    {bool isBackEnable = true, Color? appBarColor}) {
  return AppBar(
    backgroundColor: Colors.white,

    //  backgroundColor: appBarColor != null ? appBarColor : Colors.blue,
    leading: InkWell(
      onTap: isBackEnable
          ? () {
              Navigator.pop(context);
            }
          : () {},
      child: Padding(
        padding: EdgeInsets.only(left: SizeConfig.height10),
        child: Image.asset(
          'assets/images/doorwayLogo.png',
          fit: BoxFit.fitWidth,
        ),
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
