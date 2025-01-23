import 'package:doorway/global.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';

Widget signUpButton() {
  return ElevatedButton(
    onPressed: () async {},
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      minimumSize: Size(double.infinity, screenHeight * 0.07),
    ),
    child: const CustomGoogleFontText(
      text: 'Sign up',
      color: Colors.white,
      size: 19,
    ),
  );
}
