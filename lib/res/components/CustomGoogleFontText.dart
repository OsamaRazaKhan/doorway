import 'package:flutter/material.dart';

class CustomGoogleFontText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;

  //final VoidCallback? onClick;
  final TextOverflow? overflow;
  final int? maxline;
  final TextDecoration? decoration;
  final TextAlign? textAlign;

  const CustomGoogleFontText({
    Key? key,
    this.text,
    this.size,
    this.fontWeight,
    this.color,
    //this.onClick,
    this.overflow,
    this.textAlign,
    this.maxline,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 15),
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxline,
    );
  }
}
