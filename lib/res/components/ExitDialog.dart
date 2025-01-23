import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';
import 'CustomGoogleFontText.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //backgroundColor: Color(0xffF9C303),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.height25),
        ),
      ),
      content:
          // Text(
          //   "Are you sure you want to exit?",
          //   //style: Theme.of(context).textTheme.bodyText2,
          // ),
          const CustomGoogleFontText(
        text: 'Are you sure you want to exit?',
        color: Colors.black,
      ),
      actions: [
        TextButton(
          child: const CustomGoogleFontText(
            text: "No",
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const CustomGoogleFontText(
            text: "Yes",
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
