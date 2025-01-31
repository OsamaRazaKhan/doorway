import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/mainOnBoarding_components/custom_onBoardingButton.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';

class CustomSecondPortionOnBoarding extends StatelessWidget {
  const CustomSecondPortionOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.height40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomOnBoardingButton(
                image: 'assets/images/googlelogo.png',
                text: 'Continue with Google',
                onTap: () async {}),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomOnBoardingButton(
                image: 'assets/images/phonelogo.png',
                text: 'Continue with Phone',
                onTap: () {
                  AuthViewModel.moveToPhoneRegistration(context, popable: true);
                }),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: Text(
                "-- OR --",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: SizeConfig.width18,
                ),
              ),
            ),
            CustomOnBoardingButton(
                image: '',
                text: 'Sign up with email',
                onTap: () {
                  AuthViewModel.moveToEmailRegistration(context, popable: true);
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                    AuthViewModel.moveToSigninEmail(context, popable: true);
                  },
                  child: CustomGoogleFontText(
                    text: 'Sign in',
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
    );
  }
}
