import 'dart:convert';
import 'dart:developer';

import 'package:doorway/Model/NotificationDetailProductModel.dart';
import 'package:doorway/model/NotificationDetailAddonModel.dart';
import 'package:doorway/model/NotificationDetailOrderModel.dart';
import 'package:doorway/model/NotificationDetailVendorModel.dart';
import 'package:doorway/model/notification_model.dart';
import 'package:doorway/res/app_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var unreadNewNotificationList = <NotificationsData>[].obs;
  var unreadEarlierNotificationList = <NotificationsData>[].obs;
  var readNewNotificationList = <NotificationsData>[].obs;
  var readEarlierNotificationList = <NotificationsData>[].obs;
  var notificationOrderDetailObject = NotificationDetailOrderModel().obs;
  var notificationOrderVendorDetailObject = NotificationDetailVendorModel().obs;
  var notificationOrderProductDetailObject =
      NotificationDetailProductModel().obs;
  var notificationDetailAddonModel = NotificationDetailAddonModel().obs;

  Future notificationListingMethod(
      {required bool isRead, required String module}) async {
    isLoading.value = false;
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';

    try {
      //  isLoading.value = true;
      var response = await http.post(
        Uri.parse(AppUrl.baseUrl + AppUrl.notificationListing),
        body: {
          'read_status': isRead ? "1" : "0",
          'module': module,
          'page': '1',
          'limit': '15',
        },
        headers: headerMap,
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('data ia === $data');
      }
      NotificationModel model = NotificationModel.fromMap(data['data']);
      if (isRead) {
        readNewNotificationList.clear();
        readEarlierNotificationList.clear();
        for (var notification in model.notifications!) {
          DateTime notTime = DateTime.parse(notification.readTime!);
          if (DateTime.now().difference(notTime).inDays < 1 &&
              DateTime.now().difference(notTime).inDays > -1) {
            readNewNotificationList.add(notification);
          } else {
            readEarlierNotificationList.add(notification);
          }
        }
      } else {
        unreadNewNotificationList.clear();
        unreadEarlierNotificationList.clear();
        for (var notification in model.notifications!) {
          DateTime notTime = DateTime.parse(notification.createdAt!);
          if (DateTime.now().difference(notTime).inDays < 1 &&
              DateTime.now().difference(notTime).inDays > -1) {
            unreadNewNotificationList.add(notification);
          } else {
            unreadEarlierNotificationList.add(notification);
          }
        }
      }
      if (data['status'] == true) {
        log('Response code is ==${response.statusCode}');
      }

      // isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    isLoading.value = true;
  }

  //................... Notification Details Method...........//

  Future ecomNotificationDetailMethod({int? id}) async {
    isLoading.value = false;
    Map<String, String> headerMap = {
      'key': AppUrl.apiKey,
    };
    headerMap['token'] = 'LXZAVUOOX-00520';

    try {
      var response = await http.post(
        Uri.parse('${AppUrl.baseUrl}${AppUrl.ecomNotificationDetailUrl}'),
        body: {
          'id': id.toString(),
        },
        headers: headerMap,
        // {
        //   'key': '$apiKey',
        //   'token': UserAPICalls.instance.authToken,
        // }
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print('data ia === $data');
      }

      notificationOrderDetailObject.value =
          NotificationDetailOrderModel.fromJson(data['data']);
      notificationOrderVendorDetailObject.value =
          NotificationDetailVendorModel.fromJson(data['data']);
      notificationOrderProductDetailObject.value =
          NotificationDetailProductModel.fromJson(data['data']);
      notificationDetailAddonModel.value =
          NotificationDetailAddonModel.fromMap(data['data']);
      if (kDebugMode) {
        print('Notification List model is === $notificationOrderDetailObject');
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
}
