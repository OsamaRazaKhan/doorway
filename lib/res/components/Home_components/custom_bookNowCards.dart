import 'package:doorway/global.dart';
import 'package:doorway/res/components/Home_components/custom_bookNowSingleCard.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomBookNowCards extends StatelessWidget {
  const CustomBookNowCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.2,
      width: MediaQuery.of(context).size.width,
      margin:
          EdgeInsets.only(left: SizeConfig.width20, top: SizeConfig.height20),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        addAutomaticKeepAlives: true,
        children: const [
          CustomBooknowsinglecard(
            text1: 'Decore Services',
            text2: 'at your door step',
          ),
          CustomBooknowsinglecard(
            text1: 'Quality services,',
            text2: 'just a tap away',
          ),
        ],
      ),
    );
  }
}
