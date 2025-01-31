import 'package:doorway/res/app_url.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';

class AuthRepository {
  BasedApiServices _apiServices = NetworkApiService();

  Future<dynamic> SignUpApi(dynamic data, bool isEmail) async {
    try {
      var url;
      if (isEmail)
        url = AppUrl.baseUrl + AppUrl.emailSignUp;
      else
        url = AppUrl.baseUrl + AppUrl.phoneSignUp;
      var headers = {
        'key': AppUrl.apiKey,
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SignInApi(dynamic data, bool isEmail) async {
    try {
      var url;
      if (isEmail)
        url = AppUrl.baseUrl + AppUrl.emailLogin;
      else
        url = AppUrl.baseUrl + AppUrl.phoneLoginOTP;
      var headers = {
        'key': AppUrl.apiKey,
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> verifyOtpApi(dynamic data, {required bool forlogin}) async {
    try {
      dynamic url;
      forlogin
          ? url = AppUrl.baseUrl + AppUrl.phoneLogin
          : url = AppUrl.baseUrl + AppUrl.verifyOtp;

      var headers = {
        'key': AppUrl.apiKey,
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
