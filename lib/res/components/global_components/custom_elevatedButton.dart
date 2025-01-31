import 'package:doorway/global.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback? onPress;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        elevation: 0,
        minimumSize:
            Size(MediaQuery.of(context).size.width * 0.9, screenHeight * 0.05),
      ),
      child: loading == false
          ? CustomGoogleFontText(
              text: title,
              color: Colors.white,
              size: 19,
            )
          : const CircularProgressIndicator(
              color: Colors.white,
            ),
    );
  }
}
