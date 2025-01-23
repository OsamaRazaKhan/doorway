import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../res/app_url.dart';

// ignore: camel_case_types
class updateUserDataController extends GetxController {
  Future<bool?> updateEmailMethod({
    required String email,
  }) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';

    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.updateEmailUrl}'),
        body: {
          'email': email,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {}
      if (data['status'] == true) {
        log('Status code == ${response.statusCode}');
        if (data['message'].contains('otp sent on')) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
      return false;
    }
    return null;
  }

  //................................Veryfi-Email-OTP........................................//

  Future<bool?> verifyOtpEmailMethod({
    required String email,
    required String otp,
  }) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';

    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.verifyEmailOtpUrl}'),
        body: {
          'email': email,
          'otp': otp,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response data is $data');
      }
      if (data['message'] == 'Email updated successfully!') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
    }
    return null;
  }

  //................................Update-Phone....................................//

  Future<bool?> updatephoneMethod({
    required String phone,
  }) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';

    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.updatePhoneUrl}'),
        body: {
          'phone': phone,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response data is $data');
      }
      if (data['status'] == true) {
        log('Status code == ${response.statusCode}');
        if (data['message'].contains('otp sent on')) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
    }
    return null;
  }

  //..................................Verify-Phone-OTP.............................//

  Future<bool?> verifyPhoneOtpMethod({
    required String phone,
    required String otp,
  }) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';
    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.verifyPhoneOtpUrl}'),
        body: {
          'phone': phone,
          'otp': otp,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response data is $data');
      }
      if (data['message'] == 'Phone number updated successfully!') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
    }
    return null;
  }

  //.........................Confirm-Password.................................//

  Future<bool?> confirmPasswordMethod(
      {required String email, required String password}) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';
    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.confirmPasswordUrl}'),
        body: {
          'email': email,
          'password': password,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response data is $data');
      }
      if (data['message'] == 'User Verified!') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
    }
    return null;
  }

  //.........................Verify-Old-Phone....................................//

  Future<bool?> verifyOldPhoneMethod({
    required String phone,
  }) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';
    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.verifyOldPhoneUrl}'),
        body: {
          'phone': phone,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response data is $data');
      }
      if (data['message'] == 'otp sent to Phone number successfully!') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
    }
    return null;
  }

  //........................Verify-Old-Phone-Otp..............................//

  Future<bool?> verifyOldPhoneOtpMethod({
    required String phone,
    required String otp,
  }) async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';
    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.verifyOldPhoneOTPUrl}'),
        body: {
          'phone': phone,
          'otp': otp,
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('Response data is $data');
      }
      if (data['message'] == 'otp matched successfully!') {
        return true;
      }
      return false;
    } catch (e) {
      log('Catch Error Message ${e.toString()}');
    }
    return null;
  }
}
