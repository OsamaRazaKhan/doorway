import 'package:doorway/global.dart';
import 'package:doorway/Model/UserModel.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view/auth/createAccountEmail_screen.dart';
import 'package:doorway/view/auth/createAccountPhone_screen.dart';
import 'package:doorway/view/auth/mainOnBoarding_screen.dart';
import 'package:doorway/view/auth/signinEmail_screen.dart';
import 'package:doorway/view/auth/signinPhone_screen.dart';
import 'package:doorway/view/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../repository/auth_repository.dart';
import 'user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  UserModel? user;
  String? loginToken;

  /////for signup_phone
  TextEditingController nameControllerForPhone = TextEditingController();
  String phoneNumber = "";
  bool isNumberValid = false;

  bool verifyOtpForLogin = true;

  /////for signup_email
  TextEditingController nameControllerForEmail = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _authRepo = AuthRepository();

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  bool _signInLoading = false;
  bool get signInLoading => _signInLoading;

  bool _logOutLoading = false;
  bool get logoutLoading => _logOutLoading;

  bool _verifyOtpLoading = false;
  bool get verifyOtpLoading => _verifyOtpLoading;

  bool _isWorking = false;
  bool get isWorking => _isWorking;

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setSignInLoading(bool value) {
    _signInLoading = value;
    notifyListeners();
  }

  setLogOutLoading(bool value) {
    _logOutLoading = value;
    notifyListeners();
  }

  setVerifyOtpLoading(bool value) {
    _verifyOtpLoading = value;
    notifyListeners();
  }

  setIsWorking(bool value) {
    _isWorking = value;
    notifyListeners();
  }

  clearStatesForEmail() {
    nameControllerForEmail.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }

  clearStatesForPhone() {
    nameControllerForPhone.text = '';
    phoneNumber = "";
    isNumberValid = false;
  }

  static void moveToEmailRegistration(BuildContext context,
      {required bool popable}) {
    if (popable) {
      Navigator.pushNamed(
        context,
        RoutesName.createAccountEmail_screen,
      );
    } else {
      Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => CreateAccountEmailScreen(),
          ));
    }
  }

  static void moveToPhoneRegistration(BuildContext context,
      {required bool popable}) {
    if (popable) {
      Navigator.pushNamed(
        context,
        RoutesName.createAccountPhone_screen,
      );
    } else {
      Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => CreateAccountPhoneScreen(),
          ));
    }
  }

  static void moveToSigninPhone(BuildContext context, {required bool popable}) {
    if (popable) {
      Navigator.pushNamed(
        context,
        RoutesName.signinPhone_screen,
      );
    } else {
      Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const SignInPhoneScreen(),
          ));
    }
  }

  static void moveToSigninEmail(BuildContext context, {required bool popable}) {
    if (popable) {
      Navigator.pushNamed(
        context,
        RoutesName.signinEmail_screen,
      );
    } else {
      Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const SignInEmailScreen(),
          ));
    }
  }

  static void moveToHomeScreen(BuildContext context, {required bool popable}) {
    if (popable) {
      Navigator.pushNamed(
        context,
        RoutesName.home_screen,
      );
    } else {
      Navigator.pushReplacement(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }
  }

  Future<void> signUpApi(
      dynamic data, BuildContext context, bool isEmail) async {
    setIsWorking(true);
    setSignUpLoading(true);
    _authRepo.SignUpApi(data, isEmail).then((value) {
      setSignUpLoading(false);
      if (value['code'] == "201" || value['code'] == 201) {
        Map<String, dynamic> arguments = {
          "emailPhone": isEmail == true ? data["email"] : data["phone"],
          "isEmail": isEmail
        };
        verifyOtpForLogin = false;
        Navigator.pushNamed(
            navigatorKey.currentContext!, RoutesName.otp_verification_screen,
            arguments: arguments);
      }
      Utils.flushBarSuccessMessage(
          value['message'], navigatorKey.currentContext!);
      if (kDebugMode) {
        print(value.toString());
      }
      setIsWorking(false);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      // if (kDebugMode) {
      Utils.flushBarErrorMessage(error.toString(), context);
      setIsWorking(false);
      // }
    });
  }

  Future<void> LoginApi(dynamic data, BuildContext context, bool isEmail,
      UserViewModel userViewModel) async {
    setIsWorking(true);
    setSignInLoading(true);
    _authRepo.SignInApi(data, isEmail).then((value) {
      setSignInLoading(false);
      if (value['code'] == "201" || value['code'] == 201) {
        if (isEmail) {
          UserModel user = UserModel.fromMap(value['data']['user']);
          userViewModel.saveUser(user);
          userViewModel.saveLoginToken(value['data']['token']);
          if (userViewModel.rememberLogin == true) {
            userViewModel.saveLoginCred(data['email'], data['password']);
          } else {
            userViewModel.removeLoginCred();
            userViewModel.setRememberLogin(true);
          }
          Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        } else {
          Map<String, dynamic> arguments = {
            "emailPhone": data["phone"],
            "isEmail": isEmail
          };
          verifyOtpForLogin = true;
          Navigator.pushNamed(
              navigatorKey.currentContext!, RoutesName.otp_verification_screen,
              arguments: arguments);
        }
      }
      Utils.flushBarSuccessMessage(
          value['message'], navigatorKey.currentContext!);
      if (kDebugMode) {
        print(value.toString());
      }
      setIsWorking(false);
    }).onError((error, stackTrace) {
      setSignInLoading(false);
      // if (kDebugMode) {
      Utils.flushBarErrorMessage(error.toString(), context);
      setIsWorking(false);
      // }
    });
  }

  Future<void> LogOut(BuildContext context, UserViewModel userViewModel) async {
    setIsWorking(true);
    setLogOutLoading(true);
    Future.delayed(Duration(seconds: 2));
    userViewModel.remvoeUser().then((value) {
      userViewModel.removeLoginToken();
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainOnBoardingScreen()),
          (route) => false);
    });
    setLogOutLoading(false);
    setIsWorking(false);
  }

  Future<void> verifyOtp(dynamic data, BuildContext context) async {
    setIsWorking(true);
    setVerifyOtpLoading(true);
    _authRepo.verifyOtpApi(data, forlogin: verifyOtpForLogin).then((value) {
      setVerifyOtpLoading(false);
      if (value['code'] == "201" || value['code'] == 201) {
        user = UserModel.fromMap(value['data']['user']);
        loginToken = value['data']['token'];

        clearStatesForPhone();
        clearStatesForEmail();
        if (verifyOtpForLogin == false) {
          Navigator.pushNamed(
            navigatorKey.currentContext!,
            RoutesName.accountCreation_success_screen,
          );
        } else {
          final userViewModel =
              Provider.of<UserViewModel>(context, listen: false);
          userViewModel.saveUser(user!);
          userViewModel.saveLoginToken(loginToken!);
          userViewModel.setRememberLogin(true);
          Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
          Utils.flushBarSuccessMessage(
              'User authenticated successfully', navigatorKey.currentContext!);
        }
      }
      // Utils.flushBarSuccessMessage(value['message'], context);
      if (kDebugMode) {
        print(value.toString());
      }
      setIsWorking(false);
    }).onError((error, stackTrace) {
      setVerifyOtpLoading(false);
      // if (kDebugMode) {
      Utils.flushBarErrorMessage(
          error.toString(), navigatorKey.currentContext!);
      setIsWorking(false);
      // }
    });
  }
}
