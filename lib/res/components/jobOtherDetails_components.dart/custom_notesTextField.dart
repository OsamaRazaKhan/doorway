import 'package:flutter/material.dart';

class CustomNotesTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  final Color backgroundColor;
  final Color fillColor;
  final Color borderColor;

  const CustomNotesTextField({
    Key? key,
    required this.controller,
    this.maxLines = 10,
    this.hintText = "Notes (optional)",
    this.backgroundColor = const Color(0xFFE0E0E0), // Default grey.shade300
    this.fillColor = const Color(0xFFEEEEEE), // Default grey.shade200
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  _CustomNotesTextFieldState createState() => _CustomNotesTextFieldState();
}

class _CustomNotesTextFieldState extends State<CustomNotesTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: widget.backgroundColor,
      ),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.borderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.borderColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
