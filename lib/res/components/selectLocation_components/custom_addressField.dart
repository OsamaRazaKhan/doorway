import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomAddressField extends StatelessWidget {
  final String title;
  final String exampleTitle;
  final String hintText;
  final bool divider;
  final TextEditingController controller;
  const CustomAddressField(
      {super.key,
      required this.title,
      required this.controller,
      this.exampleTitle = '',
      this.hintText = '',
      this.divider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomGoogleFontText(
          text: title,
          size: 15,
          fontWeight: FontWeight.bold,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(top: SizeConfig.height10),
              isDense: true,
              hintStyle: const TextStyle(
                color: Colors.black54,
              ),
              border: InputBorder.none),
        ),
        divider == true
            ? const Divider(
                thickness: 2,
                color: Colors.black,
              )
            : const SizedBox.shrink(),
        exampleTitle != ''
            ? CustomGoogleFontText(
                text: exampleTitle,
                size: 15,
                fontWeight: FontWeight.bold,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
