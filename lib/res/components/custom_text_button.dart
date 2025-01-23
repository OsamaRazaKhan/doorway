import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';
import '../color.dart';
import 'CustomGoogleFontText.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomTextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: SizeConfig.height35,
          width: SizeConfig.screenWidth,
          //margin: EdgeInsets.symmetric(horizontal: SizeConfig.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor),
          child: Center(
              child: CustomGoogleFontText(
            text: 'Continue',
            size: SizeConfig.width15,
            color: Colors.white,
          ))),
    ) /*TextButton(
      onPressed: onPressed,
      child: Text(
        "Continue",
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: AppColors.primaryColor)))),
    )*/
        ;
  }
}

class ChangeButton extends StatefulWidget {
  final void Function()? onPress;

  const ChangeButton({Key? key, this.onPress}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChangeButtonState createState() => _ChangeButtonState();
}

class _ChangeButtonState extends State<ChangeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 35,
      child: TextButton(
        onPressed: widget.onPress,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor),
            foregroundColor:
                MaterialStateProperty.all<Color>(AppColors.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: AppColors.primaryColor)))),
        child: const Text(
          "Change",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
