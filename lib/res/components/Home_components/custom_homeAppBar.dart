import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: Colors.white,

    //  backgroundColor: appBarColor != null ? appBarColor : Colors.blue,
    leading: Padding(
      padding: EdgeInsets.only(left: SizeConfig.height10),
      child: Image.asset(
        'assets/images/doorwayLogo.png',
        fit: BoxFit.fitWidth,
      ),
    ),

    elevation: 0.0,
    automaticallyImplyLeading: true,
    title: CustomGoogleFontText(
      text: 'Wellcome',
      fontWeight: FontWeight.bold,
      color: Colors.black,
      size: SizeConfig.width30,
    ),
    centerTitle: true,
  );
}
