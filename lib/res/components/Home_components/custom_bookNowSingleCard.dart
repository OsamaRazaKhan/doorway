import 'package:doorway/global.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomBooknowsinglecard extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomBooknowsinglecard(
      {super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.width8),
      height: screenHeight * 0.40,
      width: MediaQuery.of(context).size.width * 0.84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(242, 242, 242, 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: SizeConfig.width10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Content Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.height10, left: SizeConfig.width10),
                  height: screenHeight * 0.18,
                  width: MediaQuery.of(context).size.width * 0.42,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.height10, left: SizeConfig.width10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.height20,
                        ),
                        CustomGoogleFontText(
                          text: text1,
                          size: 15,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: SizeConfig.height3,
                        ),
                        CustomGoogleFontText(
                          text: text2,
                          size: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Reduce the icon size and use Expanded
            Expanded(
              child: Icon(
                Icons.charging_station,
                color: AppColors.primaryColor,
                size: MediaQuery.of(context).size.width *
                    0.18, // Adjust size based on screen width
              ),
            ),
          ],
        ),
      ),
    );
  }
}
