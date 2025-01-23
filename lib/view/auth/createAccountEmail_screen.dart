// ignore_for_file: must_be_immutable, use_build_context_synchronously, library_private_types_in_public_api

import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';

import '../../view_model/auth_view_model.dart';

class CreateAccountEmailScreen extends StatefulWidget {
  CreateAccountEmailScreen({
    Key? key,
  }) : super(key: key);
  @override
  _CreateAccountEmailScreenState createState() =>
      _CreateAccountEmailScreenState();
}

class _CreateAccountEmailScreenState extends State<CreateAccountEmailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool validateData() {
    if (nameController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a name', context);
      return false;
    }
    if (emailController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide an email', context);
      return false;
    }
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Utils.flushBarErrorMessage('Passwords do not match', context);
      return false;
    }
    if (passwordController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a password', context);
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      Utils.flushBarErrorMessage(
          'Password must be at least 6 characters', context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.height10,
                  horizontal: SizeConfig.width20),
              child: CustomGoogleFontText(
                text: 'Create Account',
                color: Colors.black,
                size: SizeConfig.width30,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width20, vertical: SizeConfig.height10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Full Name *",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width20, vertical: SizeConfig.height10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Email Address  *",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width20, vertical: SizeConfig.height10),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Password *",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width20, vertical: SizeConfig.height10),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Confirm Password *",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.height25, horizontal: SizeConfig.width50),
            child: CustomElevatedButton(
                title: "Sign up",
                loading: authViewModel.signUpLoading,
                onPress: authViewModel.isWorking == false
                    ? () {
                        bool chk = validateData();
                        if (chk) {
                          Map data = {
                            'name': nameController.text.toString(),
                            'email': emailController.text.toString(),
                            'password': passwordController.text.toString(),
                          };
                          authViewModel.signUpApi(data, context, true);
                        }
                      }
                    : null),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.width50),
            child: OutlinedButton(
              onPressed: authViewModel.isWorking == false
                  ? () {
                      AuthViewModel.moveToPhoneRegistration(context);
                    }
                  : null,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
                minimumSize: Size(double.infinity, SizeConfig.height50),
              ),
              child: CustomGoogleFontText(
                text: 'Sign up with phone',
                color: AppColors.primaryColor,
                size: 19,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.height30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomGoogleFontText(
                  text: 'Already have an account? ',
                  color: Colors.black,
                ),
                InkWell(
                  onTap: authViewModel.isWorking == false
                      ? () {
                          AuthViewModel.moveToSigninEmail(context);
                        }
                      : null,
                  child: CustomGoogleFontText(
                      text: 'Sign in', color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          const Center(
              child: CustomGoogleFontText(
                  text: 'By clicking continue, you agree to our terms',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                  // AppColors.shopLightGreyColor,
                  )),
        ],
      ),
    );
  }
}
