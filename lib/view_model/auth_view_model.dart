import 'package:doorway/global.dart';
import 'package:doorway/Model/UserModel.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../repository/auth_repository.dart';
import 'user_view_model.dart';

class AuthViewModel with ChangeNotifier {
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

  static void moveToEmailRegistration(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.createAccountEmail_screen,
    );
  }

  static void moveToPhoneRegistration(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.createAccountPhone_screen,
    );
  }

  static void moveToSigninPhone(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.signinPhone_screen);
  }

  static void moveToSigninEmail(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.signinEmail_screen);
  }

  static void moveToHomeScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.home_screen,
    );
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
        Navigator.pushNamed(context, RoutesName.otp_verification_screen,
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
        UserModel user = UserModel.fromMap(value['data']['user']);
        userViewModel.saveUser(user);
        userViewModel.saveLoginToken(value['data']['token']);
        if (userViewModel.rememberLogin == true) {
          userViewModel.saveLoginCred(data['email'], data['password']);
        } else {
          userViewModel.removeLoginCred();
          userViewModel.setRememberLogin(true);
        }
        Navigator.pushNamed(
          context,
          RoutesName.home_screen,
        );
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
      Navigator.pushNamed(context, RoutesName.signinEmail_screen);
    });
    setLogOutLoading(false);
    setIsWorking(false);
  }

  Future<void> VerifyOtp(dynamic data, BuildContext context) async {
    setIsWorking(true);
    setVerifyOtpLoading(true);
    _authRepo.verifyOtpApi(data).then((value) {
      setVerifyOtpLoading(false);
      if (value['code'] == "201" || value['code'] == 201) {
        Navigator.pushNamed(
          context,
          RoutesName.accountCreation_success_screen,
        );
      }
      // Utils.flushBarSuccessMessage(value['message'], context);
      if (kDebugMode) {
        print(value.toString());
      }
      setIsWorking(false);
    }).onError((error, stackTrace) {
      setVerifyOtpLoading(false);
      // if (kDebugMode) {
      Utils.flushBarErrorMessage(error.toString(), context);
      setIsWorking(false);
      // }
    });
  }
}
