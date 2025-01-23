import 'package:doorway/global.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

Widget bookNowCards(BuildContext context) {
  return Container(
    height: screenHeight * 0.2,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(left: SizeConfig.width20, top: SizeConfig.height20),
    child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      addAutomaticKeepAlives: true,
      children: [
        bookNowCard(context),
        bookNowCard(context),
        bookNowCard(context),
      ],
    ),
  );
}

Widget bookNowCard(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: SizeConfig.width8),
    height: screenHeight * 0.40,
    width: screenWidth * 0.84,
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
                width: screenWidth * 0.42,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.height10, left: SizeConfig.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomGoogleFontText(
                        text: 'Decore service',
                        size: 15,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: SizeConfig.height3,
                      ),
                      const CustomGoogleFontText(
                        text: 'at your door step',
                        size: 15,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: SizeConfig.height15,
                      ),
                      Container(
                        height: SizeConfig.height30,
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 10, 1, 1),
                        ),
                        child: const Center(
                          child: CustomGoogleFontText(
                            text: 'Book Now',
                            color: Color.fromARGB(179, 248, 246, 246),
                            size: 11,
                          ),
                        ),
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
              size: screenWidth * 0.18, // Adjust size based on screen width
            ),
          ),
        ],
      ),
    ),
  );
}
