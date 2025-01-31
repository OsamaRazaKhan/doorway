import 'package:doorway/global.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view/auth/mainOnBoarding_screen.dart';
import 'package:doorway/view/home_screen.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final userViewModel = Provider.of<UserViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const MainOnBoardingScreen()),
            (route) => false);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(247, 249, 252, 1),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.height20, horizontal: SizeConfig.width20),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset(
                    'assets/images/shop-account-success.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: SizeConfig.height10)),
                Text(
                  "Success!",
                  style: TextStyle(
                      color: Colors.black, fontSize: SizeConfig.height40),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: SizeConfig.height10)),
                Text(
                  "Your account is created. Enjoy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.width21,
                      height: 1.5),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.height15,
                      vertical: SizeConfig.height10),
                  width: double.infinity,
                  height: SizeConfig.height65,
                  child: ElevatedButton(
                    onPressed: () {
                      userViewModel.saveUser(authViewModel.user!);
                      userViewModel.saveLoginToken(authViewModel.loginToken!);
                      userViewModel.setRememberLogin(true);

                      Navigator.of(navigatorKey.currentContext!)
                          .pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.height30),
                      ),
                    ),
                    child: Text(
                      'Start using',
                      style: TextStyle(
                          fontSize: SizeConfig.width19, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
