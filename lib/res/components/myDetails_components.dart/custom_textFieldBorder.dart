import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

InputDecoration textFieldBorder(String input, BuildContext context) {
  return InputDecoration(
    focusColor: Theme.of(context).primaryColor,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: input.isNotEmpty ? Colors.black : Colors.black26,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    isDense: true,
    contentPadding: EdgeInsets.only(top: SizeConfig.height20),
    suffixIcon: input.isNotEmpty
        ? const Icon(
            Icons.check,
            color: Colors.black,
          )
        : null,
  );
}
