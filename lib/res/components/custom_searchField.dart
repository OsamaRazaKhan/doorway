import 'package:doorway/global.dart';
import 'package:flutter/material.dart';

Widget searchField() {
  return Container(
    margin: const EdgeInsets.only(left: 25, right: 33),
    height: screenHeight * 0.07,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(26)),
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide.none,
        ),
        hintText: 'Find your desired Service',
        hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
        contentPadding: const EdgeInsets.only(top: 5, left: 20),
        prefixIcon: const Icon(Icons.search),
        filled: true,
      ),
    ),
  );
}
