import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatefulWidget {
  final String name;
  final String description;
  final int? itemValue;

  const ItemContainer({
    Key? key,
    required this.name,
    required this.description,
    this.itemValue,
  }) : super(key: key);

  @override
  _ItemContainerState createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          CustomGoogleFontText(
            text: widget.name,
            size: SizeConfig.width17,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomGoogleFontText(
            text: widget.description,
            size: SizeConfig.width15,
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
