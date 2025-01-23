import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashServices {
  Future<dynamic> getLoginToken() => UserViewModel().getLoginToken();

  void checkAuthentication(BuildContext context) {
    getLoginToken().then((loginToken) async {
      if (loginToken != null && loginToken.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 3));

        final userViewModel =
            Provider.of<UserViewModel>(context, listen: false);
        userViewModel.loginUser = await UserViewModel().getUser();
        Navigator.pushNamed(context, RoutesName.home_screen);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.mainOnBoarding_screen);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
