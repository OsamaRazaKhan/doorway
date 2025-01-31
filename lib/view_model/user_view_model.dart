import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/UserModel.dart';

class UserViewModel with ChangeNotifier {
  UserModel? loginUser;

  bool _rememberLogin = true;
  bool get rememberLogin => _rememberLogin;

  bool _loading = false;
  bool get loading => _loading;

  setRememberLogin(bool value) {
    _rememberLogin = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  static void moveToSavedAddresses(BuildContext context, {wannaPlaceOrder}) {
    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);
    locationViewModel.wannaPlaceOrder = wannaPlaceOrder;
    Navigator.pushNamed(
      context,
      RoutesName.SavedAddresses_view,
    );
  }

  Future<bool?> checkLogin() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? checkLogin = sp.getString('loginEmail');
    if (checkLogin == null) return true;
    return true;
  }

  Future<void> saveLoginCred(String email, String Password) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('loginEmail', email);
    sp.setString('loginPassword', Password);
    notifyListeners();
  }

  static Future<dynamic> getLoginCred() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? loginEmail = sp.getString('loginEmail');
    if (loginEmail == null) return null;
    String? loginPassword = sp.getString('loginPassword');
    Map<String, dynamic> loginCred = {
      'loginEmail': loginEmail,
      'loginPassword': loginPassword
    };
    return loginCred;
  }

  Future<bool> removeLoginCred() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('loginEmail');
    sp.remove('loginPassword');
    return true;
  }

  Future<bool> saveUser(UserModel user) async {
    loginUser = user;
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('userId', user.id!);
    sp.setString('name', user.name.toString());
    sp.setString('userName', user.userName.toString());
    sp.setString('userEmail', user.email.toString());
    sp.setString('userPhone', user.phone.toString());
    sp.setString('userPhoto', user.photo.toString());

    notifyListeners();
    return true;
  }

  Future<dynamic> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final int? userId = sp.getInt('userId');
    if (userId == null) return null;
    final String? name = sp.getString('name');
    final String? userName = sp.getString('userName');
    final String? email = sp.getString('userEmail');
    final String? photoUrl = sp.getString('userPhoto');
    final String? phone = sp.getString('userPhone');
    return UserModel(
        id: userId,
        name: name,
        userName: userName,
        email: email,
        photo: photoUrl,
        phone: phone);
  }

  Future<bool> remvoeUser() async {
    loginUser = null;
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userId');
    sp.remove('name');
    sp.remove('userName');
    sp.remove('email');
    sp.remove('phone');
    sp.remove('photoUrl');
    return true;
  }

  Future<bool> saveLoginToken(String token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('loginToken', token);
    notifyListeners();
    return true;
  }

  Future<dynamic> getLoginToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? loginToken = sp.getString('loginToken');
    if (loginToken == null) return null;
    return loginToken;
  }

  Future<bool> removeLoginToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('loginToken');
    return true;
  }
}
