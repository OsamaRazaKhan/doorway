import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomAccountSettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomAccountSettingsItem(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width25, vertical: SizeConfig.height17),
        child: Row(
          children: [
            Expanded(
              flex: 20,
              child: CustomGoogleFontText(
                text: title,
                color: Colors.black,
                size: 16,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: SizeConfig.width15,
            ),
          ],
        ),
      ),
    );
  }
}
