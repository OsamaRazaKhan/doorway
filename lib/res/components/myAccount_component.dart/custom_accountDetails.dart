import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAccountDetails extends StatelessWidget {
  const CustomAccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userViewModel.loginUser!.name!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        Text(
          userViewModel.loginUser!.email!,
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
        ),
        //Divider(color: Colors.black),
      ],
    );
  }
}
