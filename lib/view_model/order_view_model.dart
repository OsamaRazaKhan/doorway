import 'dart:convert';

import 'package:doorway/global.dart';
import 'package:doorway/repository/order_repository.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view/home_screen.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:doorway/view_model/location_view_model.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderViewModel with ChangeNotifier {
  final _orderRepo = OrderRepository();

  bool _isWorking = false;
  bool get isWorking => _isWorking;

  bool _orderLoading = false;
  bool get orderLoading => _orderLoading;

  setIsWorking(bool value) {
    _isWorking = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _orderLoading = value;
    notifyListeners();
  }

  Future<void> placeOrder(
    dynamic data,
  ) async {
    setIsWorking(true);
    print(data);
    setLoading(true);
    _orderRepo.PlaceOrderApi(data).then((value) {
      setLoading(false);
      if (value['code'] == "201" || value['code'] == 201) {
        Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false, // This removes all previous routes.
        );
      }
      Utils.flushBarSuccessMessage(
          value['message'], navigatorKey.currentContext!);
      if (kDebugMode) {
        print(value.toString());
      }
      setIsWorking(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      // if (kDebugMode) {
      Utils.flushBarErrorMessage(
          error.toString(), navigatorKey.currentContext!);
      setIsWorking(false);
      // }
    });
  }

  dynamic getOrderInstance(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    final subServicesViewModel =
        Provider.of<SubServicesViewModel>(context, listen: false);
    final servicesViewModel =
        Provider.of<ServicesViewModel>(context, listen: false);
    final scheduleViewModel =
        Provider.of<ScheduleViewModel>(context, listen: false);
    final locationViewModel =
        Provider.of<LocationViewModel>(context, listen: false);

    Map data = {
      "cat_id": 5,
      "sub_cat_id": homeViewModel.selectedCategory!.id,
      "loc_id": locationViewModel.selectedLocation!.id,
      "vendor_id": 4,
      "notes": subServicesViewModel.notesController.text,
      "details": [
        {
          "service_id": servicesViewModel.selectedService!.id,
          "sub_service_id": subServicesViewModel.subServicesList.isNotEmpty
              ? subServicesViewModel
                  .subServicesList[subServicesViewModel.selectedIndex].id
              : 0,
          "is_ladder":
              subServicesViewModel.SelectedLadderOption != "No" ? 1 : 0,
          "ladder_length": subServicesViewModel.SelectedLadderLength,
          "date_time":
              "${scheduleViewModel.selectedDay} ${scheduleViewModel.timings[scheduleViewModel.selectedTimingIndex].time}}",
          "attributes": [
            {"name": "Callout Price", "price": 12, "quantity": 1}
          ]
        }
      ],
      "images": subServicesViewModel.imagesBase64
    };
    return jsonEncode(data);
  }
}
