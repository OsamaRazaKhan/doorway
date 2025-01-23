import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomOrderSingleContainer extends StatefulWidget {
  final int index;
  final dynamic ordersList;
  const CustomOrderSingleContainer(
      {super.key, required this.index, required this.ordersList});

  @override
  State<CustomOrderSingleContainer> createState() =>
      _CustomOrderSingleContainerState();
}

class _CustomOrderSingleContainerState
    extends State<CustomOrderSingleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.width10,
          right: SizeConfig.width10,
          top: SizeConfig.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black45),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width20, vertical: SizeConfig.height6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGoogleFontText(
                  text: widget.ordersList[widget.index].catName!,
                  size: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                CustomGoogleFontText(
                  text: '$currency ${widget.ordersList[widget.index].total!}',
                  size: 14,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGoogleFontText(
                  text: 'Status: ${widget.ordersList[widget.index].status!}',
                  color: Colors.black,
                  size: 12,
                  fontWeight: FontWeight.bold,
                ),
                const Text(
                  '',
                  // controller
                  //     .liveorderlist[index]
                  //     .dateTime!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
