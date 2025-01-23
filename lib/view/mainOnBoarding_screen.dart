import 'package:doorway/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/color.dart';
import '../res/components/CustomGoogleFontText.dart';
import '../res/components/custom_imageTextOntap_button.dart';
import '../utils/SizeConfig.dart';
import '../view_model/auth_view_model.dart';

class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainOnBoardingScreenState createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.5),
            child: Column(
              children: [
                getButton('assets/images/googlelogo.png',
                    'Continue with Google', () async {}),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                getButton('assets/images/phonelogo.png', 'Continue with Phone ',
                    () {
                  AuthViewModel.moveToPhoneRegistration(context);
                }),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: Text(
                    "-- or --",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: SizeConfig.width18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: SizedBox(
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthViewModel.moveToEmailRegistration(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                        minimumSize: Size(double.infinity, SizeConfig.height50),
                      ),
                      child: CustomGoogleFontText(
                        text: 'Sign up with email',
                        color: Colors.white,
                        size: SizeConfig.width17,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomGoogleFontText(
                      text: 'Already have an account? ',
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () {
                        AuthViewModel.moveToSigninEmail(context);
                      },
                      child: CustomGoogleFontText(
                        text: 'Sign in',
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Center(
                  child: InkWell(
                      onTap: () {},
                      child: CustomGoogleFontText(
                          text: 'Continue as Guest',
                          color: AppColors.primaryColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
