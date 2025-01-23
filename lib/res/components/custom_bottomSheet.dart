import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

showBottomSheet(BuildContext context, int index, {required isPressOnDefault}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12.0), topEnd: Radius.circular(12.0)),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 220,
        child: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.height20),
            Visibility(
              visible: !isPressOnDefault,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.width90),
                  height: SizeConfig.height35,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: CustomGoogleFontText(
                      text: 'Set Default Location',
                      size: SizeConfig.width15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.height20),
            GestureDetector(
              onTap: () {},
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                // width: 210,
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.width90),
                height: SizeConfig.height35,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: CustomGoogleFontText(
                    text: 'Edit Location',
                    size: SizeConfig.width15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.height20),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.width90),
                height: SizeConfig.height35,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: CustomGoogleFontText(
                    text: 'Delete Location',
                    textAlign: TextAlign.center,
                    size: SizeConfig.width15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
