import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomAddresscontainer extends StatelessWidget {
  final String flat;
  final String building;
  final String address;
  const CustomAddresscontainer(
      {super.key,
      required this.flat,
      required this.building,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.width10, vertical: SizeConfig.height10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(3.0, 3.0),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primaryColor),
            child: Image.asset(
              'assets/images/home_marker.png',
              width: 25,
              height: 25,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomGoogleFontText(
                  text: '$building, $flat ',
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                CustomGoogleFontText(
                  text: address,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
