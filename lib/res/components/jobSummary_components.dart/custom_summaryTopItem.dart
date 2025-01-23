import 'package:flutter/material.dart';

import '../../../utils/SizeConfig.dart';
import '../CustomGoogleFontText.dart';

// ignore: must_be_immutable
class CustomSummaryTopItem extends StatefulWidget {
  String title;
  String text;
  Function() onTap;

  CustomSummaryTopItem(
      {Key? key, required this.title, required this.text, required this.onTap})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomSummaryTopItemState createState() => _CustomSummaryTopItemState();
}

class _CustomSummaryTopItemState extends State<CustomSummaryTopItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomGoogleFontText(
            text: widget.title,
            size: SizeConfig.width15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: SizeConfig.height5,
        ),
        Container(
          height: SizeConfig.height55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.width10),
                    child: CustomGoogleFontText(
                      text: widget.text,
                      color: Colors.black54,
                      size: SizeConfig.width14,
                    )),
              ),
              widget.title != "Vendor"
                  ? IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: widget.onTap,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
