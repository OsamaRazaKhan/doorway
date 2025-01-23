// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:doorway/model/orderModel.dart';
import 'package:doorway/res/app_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/BookOrderListingModel.dart';

class OrderListingsController extends GetxController {
  var liveorderlist = <OrderModel>[].obs;
  var historyorderlist = <OrderModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    /*historyListingMethod();
    liveListingMethod();*/
    super.onInit();
  }

  //................. Live Api Calling ...............//

  Future liveListingMethod() async {
    try {
      isLoading.value = false;
      liveorderlist.clear();
      var response = await http.post(
          Uri.parse('${AppUrl.baseUrl}${AppUrl.ecomUserOrderListingLiveUrl}'),
          body: {
            'type': 'live',
            'page': '1',
            'limit': '20',
          },
          headers: {
            'key': AppUrl.apiKey,
            'token': 'LXZAVUOOX-00520' //UserAPICalls.instance.authToken,
          });
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('check data is === $data');

        OrderListingBookingModel model =
            OrderListingBookingModel.fromMap(data['data']);
        print('Model is == $model');
        liveorderlist.value = model.data!;
        print('my order list is == $liveorderlist');
        isLoading.value = true;
      }
      log('out of box');
      // ignore: empty_catches
    } catch (e) {}
    // finally {
    //   isLoading(false);
    // }
  }

  //............ History Api Calling..............//

  Future historyListingMethod() async {
    try {
      isLoading.value = false;
      historyorderlist.clear();
      var response = await http.post(
          Uri.parse(
              '${AppUrl.baseUrl}${AppUrl.ecomUserOrderListinghistoryUrl}'),
          body: {
            'type': 'history',
            'page': '1',
            'limit': '20',
          },
          headers: {
            'key': AppUrl.apiKey,
            'token': 'LXZAVUOOX-00520' //UserAPICalls.instance.authToken,
          });
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('check data is === $data');

        OrderListingBookingModel model =
            OrderListingBookingModel.fromMap(data['data']);
        print('Model is == $model');
        historyorderlist.value = model.data!;
        print('history  list is == $historyorderlist');
      }
      isLoading.value = true;

      log('out of box');
      // ignore: empty_catches
    } catch (e) {}
  }
}
