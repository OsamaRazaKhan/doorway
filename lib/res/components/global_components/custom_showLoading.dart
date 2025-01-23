import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class CustomShowLoading extends StatefulWidget {
  final String title;
  const CustomShowLoading({super.key, required this.title});

  @override
  State<CustomShowLoading> createState() => _CustomShowLoadingState();
}

class _CustomShowLoadingState extends State<CustomShowLoading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.height50,
          width: SizeConfig.width50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            strokeWidth: 4,
          ),
        ),
        SizedBox(height: SizeConfig.height20),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
