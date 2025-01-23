import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/RewardListingModel.dart';
import '../Model/UserRewardListingModel.dart';
import '../res/app_url.dart';

class RewardController extends GetxController {
  var isLoading = false.obs;
  var rewardList = <RewardsData>[].obs;
  var userRewardObject = UserRewardListingModel().obs;

  Future rewardListingMethod() async {
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.ecomrewardListingUrl}'),
        body: {
          'page': '1',
          'limit': '15',
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('data ia === $data');
      }
      RewardListingModel model = RewardListingModel.fromJson(data['data']);
      rewardList.value = model.rewardsData!;
      if (kDebugMode) {
        print('Reward List is === $rewardList');
      }

      if (data['status'] == true) {
        log('Response code is ==${response.statusCode}');
        // snackBarSuccess(data['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    isLoading.value = true;
  }

  Future userRewardListingMethod() async {
    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.ecomUserRewardListingUrl}'),
        headers: {
          'key': AppUrl.apiKey,
          'token': 'LXZAVUOOX-00520',
          // 'YDQCSZYAJ-28755',
          'Content-Type': 'application/json',
        },
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('data is === $data');
      }
      UserRewardListingModel usermodel = UserRewardListingModel.fromJson(data);
      userRewardObject.value = usermodel;
      if (kDebugMode) {
        print('User Reward Model is ==$usermodel');
      }

      if (data['code'] == '201') {
        log('Response code is ==${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    isLoading.value = true;
  }
}
