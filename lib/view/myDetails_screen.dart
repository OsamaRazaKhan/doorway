import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/myDetails_components.dart/custom_textFieldBorder.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/myDetails_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopMyDetailsScreen extends StatefulWidget {
  const ShopMyDetailsScreen({super.key});

  @override
  State<ShopMyDetailsScreen> createState() => _ShopMyDetailsScreenState();
}

class _ShopMyDetailsScreenState extends State<ShopMyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final myDetailsViewModel = Provider.of<MyDetailsViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: shopAppbarBack("My Details", context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: SizeConfig.height60,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/myaccount.png',
                  ),
                ),
              ),
              Text(
                "Name",
                style: TextStyle(
                  color: myDetailsViewModel.nameController.text.isNotEmpty
                      ? Colors.black
                      : Colors.black54,
                  fontSize: SizeConfig.height15,
                ),
              ),
              TextField(
                controller: myDetailsViewModel.nameController,
                decoration: textFieldBorder(
                    myDetailsViewModel.nameController.text, context),
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.height12),
                maxLines: 1,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
              Text(
                "Date of birth",
                style: TextStyle(
                  color: myDetailsViewModel.dobController.text.isNotEmpty
                      ? Colors.black
                      : Colors.black54,
                  fontSize: SizeConfig.height15,
                ),
              ),
              TextField(
                controller: myDetailsViewModel.dobController,
                decoration: textFieldBorder(
                    myDetailsViewModel.dobController.text, context),
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.height12),
                maxLines: 1,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
              Text(
                "Mostly interested in",
                style: TextStyle(
                  color:
                      myDetailsViewModel.interestedInController.text.isNotEmpty
                          ? Colors.black
                          : Colors.black54,
                  fontSize: SizeConfig.height15,
                ),
              ),
              TextField(
                controller: myDetailsViewModel.interestedInController,
                decoration: textFieldBorder(
                    myDetailsViewModel.interestedInController.text, context),
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.height12),
                maxLines: 1,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
              Text(
                "Email address",
                style: TextStyle(
                  color: myDetailsViewModel.emailController.text.isNotEmpty
                      ? Colors.black
                      : Colors.black54,
                  fontSize: SizeConfig.height15,
                ),
              ),
              TextField(
                controller: myDetailsViewModel.emailController,
                decoration: textFieldBorder(
                    myDetailsViewModel.emailController.text, context),
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.height12),
                maxLines: 1,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
              Text(
                "Phone",
                style: TextStyle(
                  color: myDetailsViewModel.phoneController.text.isNotEmpty
                      ? Colors.black
                      : Colors.black54,
                  fontSize: SizeConfig.height15,
                ),
              ),
              TextField(
                controller: myDetailsViewModel.phoneController,
                decoration: textFieldBorder(
                    myDetailsViewModel.phoneController.text, context),
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.height12),
                maxLines: 1,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height20)),
            ],
          ),
        ),
      ),
      bottomSheet: CustomElevatedButton(title: "Save Changes", onPress: () {}),
    );
  }
}
