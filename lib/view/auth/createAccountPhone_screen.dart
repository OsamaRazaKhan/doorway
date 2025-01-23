// ignore_for_file: must_be_immutable, use_build_context_synchronously, library_private_types_in_public_api

import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../view_model/auth_view_model.dart';

class CreateAccountPhoneScreen extends StatefulWidget {
  CreateAccountPhoneScreen({Key? key}) : super(key: key);
  @override
  _CreateAccountPhoneScreenState createState() =>
      _CreateAccountPhoneScreenState();
}

class _CreateAccountPhoneScreenState extends State<CreateAccountPhoneScreen> {
  TextEditingController nameController = TextEditingController();

  String phoneNumber = "";
  bool isNumberValid = false;

  bool validateData() {
    if (nameController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a name', context);
      return false;
    }
    if (phoneNumber.isEmpty) {
      Utils.flushBarErrorMessage('Please provide a phone number', context);
      return false;
    }
    if (!isNumberValid) {
      Utils.flushBarErrorMessage(
          'Please provide a valid phone number', context);
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
                phoneNumber = phone.completeNumber;
                try {
                  isNumberValid = phone.isValidNumber();
                } catch (e) {
                  isNumberValid = false;
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
                        bool chk = validateData();
                        if (chk) {
                          Map data = {
                            'name': nameController.text.toString(),
                            'phone': phoneNumber,
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
                      AuthViewModel.moveToEmailRegistration(context);
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
