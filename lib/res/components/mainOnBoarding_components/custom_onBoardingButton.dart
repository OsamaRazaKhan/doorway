import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingButton extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const CustomOnBoardingButton(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: AppColors.primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.height10)),
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
              image != ''
                  ? Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height * 0.03,
                    )
                  : const SizedBox.shrink(),
              CustomGoogleFontText(
                text: text,
                color: Colors.white,
                size: SizeConfig.width17,
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
