import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../../utils/SizeConfig.dart';

Widget getButton(String image, String text, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: Container(
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.height10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fitHeight,
              height: screenHeight * 0.03,
            ),
            CustomGoogleFontText(
              text: text,
              color: Colors.black,
              size: SizeConfig.width17,
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    ),
  );
}
