import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomSecondPortionCreateAccountEmail extends StatelessWidget {
  CustomSecondPortionCreateAccountEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width20, vertical: SizeConfig.height20),
          child: TextField(
            controller: authViewModel.nameControllerForEmail,
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
            controller: authViewModel.emailController,
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
            controller: authViewModel.passwordController,
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
            controller: authViewModel.confirmPasswordController,
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
                      bool chk = validateData(context);
                      if (chk) {
                        Map data = {
                          'name': authViewModel.nameControllerForEmail.text
                              .toString(),
                          'email':
                              authViewModel.emailController.text.toString(),
                          'password':
                              authViewModel.passwordController.text.toString(),
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
                    authViewModel.clearStatesForEmail();
                    AuthViewModel.moveToPhoneRegistration(context,
                        popable: false);
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
                        AuthViewModel.moveToSigninEmail(context,
                            popable: false);
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
    );
  }

  bool validateData(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final RegExp nameRegExp = RegExp(r"^[a-zA-Z\s]+$");
    final RegExp emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (authViewModel.nameControllerForEmail.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a name', context);
      return false;
    }
    if (!nameRegExp
        .hasMatch(authViewModel.nameControllerForEmail.text.trim())) {
      Utils.flushBarErrorMessage(
          'Name should contain only letters and spaces', context);
      return false;
    }
    if (authViewModel.emailController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide an email', context);
      return false;
    }
    if (!emailRegExp.hasMatch(authViewModel.emailController.text.trim())) {
      Utils.flushBarErrorMessage(
          'Please provide a valid email address', context);
      return false;
    }
    if (authViewModel.passwordController.text.trim() !=
        authViewModel.confirmPasswordController.text.trim()) {
      Utils.flushBarErrorMessage('Passwords do not match', context);
      return false;
    }
    if (authViewModel.passwordController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a password', context);
      return false;
    }
    if (authViewModel.passwordController.text.trim().length < 6) {
      Utils.flushBarErrorMessage(
          'Password must be at least 6 characters', context);
      return false;
    }
    return true;
  }
}
