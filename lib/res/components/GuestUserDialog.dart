import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';
import 'CustomGoogleFontText.dart';

class GuestUserDialog extends StatelessWidget {
  const GuestUserDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.height25),
        ),
      ),
      content: const CustomGoogleFontText(
        text: 'Please Sign In to Continue',
        color: Colors.black,
      ),
      actions: [
        TextButton(
          child: const CustomGoogleFontText(
            text: "Cancel",
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const CustomGoogleFontText(
            text: "Go to Sign In",
            color: Colors.red,
          ),
          onPressed: () {
            // Get.offAll(() => const MainOnBoardingScreen());
          },
        ),
      ],
    );
  }
}
