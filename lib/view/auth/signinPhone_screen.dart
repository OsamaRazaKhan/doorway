import 'package:doorway/global.dart';
import 'package:doorway/res/components/authenticationGlobal_components/custom_annimatedAuthContainer.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../res/components/global_components/custom_elevatedButton.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';

class SignInPhoneScreen extends StatefulWidget {
  const SignInPhoneScreen({Key? key}) : super(key: key);
  @override
  _SignInPhoneScreenState createState() => _SignInPhoneScreenState();
}

class _SignInPhoneScreenState extends State<SignInPhoneScreen> {
  String numberWithoutCode = "";
  String countryISOCode = "AE";
  String phoneNumber = "";
  bool isNumberValid = false;

  @override
  void initState() {
    super.initState();
  }

  bool validateData() {
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
    final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Container(
        height: screenHeight * 1,
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CustomAnnimatedAuthContainer(height: SizeConfig.height300),
            SizedBox(height: SizeConfig.height50),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width20,
                  vertical: SizeConfig.height30),
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
                initialCountryCode: countryISOCode,
                initialValue: numberWithoutCode,
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
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.height25,
                  horizontal: SizeConfig.width50),
              child: CustomElevatedButton(
                  title: "Sign In",
                  loading: authViewModel.signInLoading,
                  onPress: authViewModel.isWorking == false
                      ? () {
                          bool chk = validateData();
                          if (chk) {
                            Map data = {
                              'phone': phoneNumber.toString(),
                            };
                            authViewModel.LoginApi(
                                data, context, false, userViewModel);
                          }
                        }
                      : null),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.width50),
              child: OutlinedButton(
                onPressed: authViewModel.isWorking == false
                    ? () {
                        AuthViewModel.moveToSigninEmail(context,
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
                  text: 'Sign in with email',
                  size: 19,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.height50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account? "),
                  InkWell(
                    onTap: authViewModel.isWorking == false
                        ? () {
                            AuthViewModel.moveToEmailRegistration(context,
                                popable: false);
                          }
                        : null,
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
