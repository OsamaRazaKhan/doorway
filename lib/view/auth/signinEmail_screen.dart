import 'package:doorway/global.dart';
import 'package:doorway/res/components/authenticationGlobal_components/custom_annimatedAuthContainer.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../res/components/global_components/custom_elevatedButton.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({Key? key}) : super(key: key);
  @override
  _SignInEmailScreenState createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  bool isLoading = true;

  @override
  void initState() {
    fetchCredentials();
    super.initState();
  }

  void fetchCredentials() async {
    dynamic loginCred = await UserViewModel.getLoginCred();
    if (loginCred != null) {
      emailController.text = loginCred['loginEmail'];
      passwordController.text = loginCred['loginPassword'];
    }
  }

  bool validateData() {
    final RegExp emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (emailController.text.trim().isEmpty) {
      Utils.flushBarErrorMessage('Please provide an email', context);
      return false;
    }
    if (!emailRegExp.hasMatch(emailController.text.trim())) {
      Utils.flushBarErrorMessage(
          'Please provide a valid email address', context);
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
    final userViewModel = Provider.of<UserViewModel>(context);
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        body: Container(
          height: screenHeight * 1,
          color: Colors.transparent,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              CustomAnnimatedAuthContainer(height: SizeConfig.height250),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width20,
                    vertical: SizeConfig.height30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColor,
                    hintText: "Email Address *",
                  ),
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
                      icon: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
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
                      value: userViewModel.rememberLogin,
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) {
                        setState(
                          () {
                            userViewModel.setRememberLogin(value);
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
                                'email': emailController.text.toString(),
                                'password': passwordController.text.toString(),
                              };
                              authViewModel.LoginApi(
                                  data, context, true, userViewModel);
                            }
                          }
                        : null),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width50),
                child: OutlinedButton(
                  onPressed: authViewModel.isWorking == false
                      ? () {
                          AuthViewModel.moveToSigninPhone(context,
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
                    text: 'Sign in with phone',
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
      ),
    );
  }
}
