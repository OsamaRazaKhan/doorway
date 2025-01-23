import 'package:doorway/global.dart';
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
import '../../view_model/user_view_model.dart';

class SignInPhoneScreen extends StatefulWidget {
  const SignInPhoneScreen({Key? key}) : super(key: key);
  @override
  _SignInPhoneScreenState createState() => _SignInPhoneScreenState();
}

class _SignInPhoneScreenState extends State<SignInPhoneScreen> {
  TextEditingController passwordController = TextEditingController();
  bool rememberLogin = true;
  bool showPassword = false;
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
    if (passwordController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide a password', context);
      return false;
    }
    if (passwordController.text.trim().length < 4) {
      Utils.flushBarErrorMessage(
          'Password must be at least 4 characters', context);
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
            Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.height10,
                    horizontal: SizeConfig.width20),
                child: CustomGoogleFontText(
                  text: 'Login',
                  color: Colors.black,
                  size: SizeConfig.width30,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width20,
                  vertical: SizeConfig.height10),
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
                  horizontal: SizeConfig.width20,
                  vertical: SizeConfig.height10),
              child: TextField(
                controller: passwordController,
                obscureText: !showPassword,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                  hintText: "Password *",
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.width10, right: SizeConfig.width20),
              child: Row(
                children: [
                  Switch(
                    value: rememberLogin,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(
                        () {
                          rememberLogin = value;
                        },
                      );
                    },
                  ),
                  const CustomGoogleFontText(
                    text: 'Remember me',
                    color: Colors.black,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: authViewModel.isWorking == false ? () {} : null,
                    child: CustomGoogleFontText(
                      text: 'Forgot password?',
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
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
                              'code': passwordController.text.toString(),
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
                        AuthViewModel.moveToSigninEmail(context);
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
                            AuthViewModel.moveToEmailRegistration(context);
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
