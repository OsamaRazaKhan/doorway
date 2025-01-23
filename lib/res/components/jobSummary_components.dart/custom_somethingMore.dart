import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSomeThingMore extends StatefulWidget {
  const CustomSomeThingMore({super.key});

  @override
  State<CustomSomeThingMore> createState() => _CustomSomeThingMoreState();
}

class _CustomSomeThingMoreState extends State<CustomSomeThingMore> {
  @override
  Widget build(BuildContext context) {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.width20, SizeConfig.height5, SizeConfig.width20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGoogleFontText(
                  text: 'Something more specific!',
                  fontWeight: FontWeight.bold,
                  size: SizeConfig.width14,
                ),
                GestureDetector(
                  onTap: () {
                    int count = 0;
                    Navigator.of(context).popUntil((route) => count++ == 2);
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.width20, right: SizeConfig.width15),
            child: Row(
              children: [
                Expanded(
                  child: CustomGoogleFontText(
                    text: subServicesViewModel.notesController.text.isEmpty
                        ? "not specified"
                        : subServicesViewModel.notesController.text,
                    maxline: 2,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black38,
                    size: SizeConfig.width14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.height10),
        ],
      ),
    );
  }
}
