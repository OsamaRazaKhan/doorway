import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomSecondPortionCreateAccountPhone extends StatelessWidget {
  CustomSecondPortionCreateAccountPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width20, vertical: SizeConfig.height20),
          child: TextField(
            controller: authViewModel.nameControllerForPhone,
            decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              hintText: "Full Name *",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width20, vertical: SizeConfig.height10),
          child: IntlPhoneField(
            keyboardType: TextInputType.phone,
            disableLengthCheck: false,
            showDropdownIcon: false,
            flagsButtonPadding: EdgeInsets.only(bottom: SizeConfig.height2),
            style: TextStyle(color: Colors.black, fontSize: 15),
            dropdownTextStyle: TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              hintText: "Phone Number *",
            ),
            initialCountryCode: 'AE',
            onChanged: (phone) {
              authViewModel.phoneNumber = phone.completeNumber;
              try {
                authViewModel.isNumberValid = phone.isValidNumber();
              } catch (e) {
                authViewModel.isNumberValid = false;
              }
            },
          ),
        ),
        const SizedBox.shrink(),
        const SizedBox.shrink(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height25, horizontal: SizeConfig.width50),
          child: CustomElevatedButton(
              title: "Sign up",
              loading: authViewModel.signUpLoading,
              onPress: authViewModel.isWorking == false
                  ? () {
                      bool chk = validateDataForPhone(context);
                      if (chk) {
                        Map data = {
                          'name': authViewModel.nameControllerForPhone.text
                              .toString(),
                          'phone': authViewModel.phoneNumber,
                        };
                        authViewModel.signUpApi(data, context, false);
                      }
                    }
                  : null),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.width50),
          child: OutlinedButton(
            onPressed: authViewModel.isWorking == false
                ? () {
                    authViewModel.clearStatesForPhone();
                    AuthViewModel.moveToEmailRegistration(context,
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
              text: 'Sign up with email',
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

  bool validateDataForPhone(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final RegExp nameRegExp = RegExp(r"^[a-zA-Z\s]+$");
    if (authViewModel.nameControllerForPhone.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a name', context);
      return false;
    }
    if (!nameRegExp
        .hasMatch(authViewModel.nameControllerForPhone.text.trim())) {
      Utils.flushBarErrorMessage(
          'Name should contain only letters and spaces', context);
      return false;
    }
    if (authViewModel.phoneNumber.isEmpty) {
      Utils.flushBarErrorMessage('Please provide a phone number', context);
      return false;
    }
    if (!authViewModel.isNumberValid) {
      Utils.flushBarErrorMessage(
          'Please provide a valid phone number', context);
      return false;
    }

    return true;
  }
}
