import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';
import 'CustomGoogleFontText.dart';

class ShowDialogScreen extends StatefulWidget {
  const ShowDialogScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDialogScreen> createState() => _ShowDialogScreenState();
}

class _ShowDialogScreenState extends State<ShowDialogScreen> {
  // var userUpdateDataController = Get.put(updateUserDataController());
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomGoogleFontText(
        text: 'Confirm Password',
        color: Colors.black,
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.width10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'confirm email',
                focusColor: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                hintText: 'confirm password',
                focusColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const CustomGoogleFontText(
            text: "Confirm",
            color: Colors.blue,
          ),
          onPressed: () async {},
        ),
      ],
    );
  }
}
