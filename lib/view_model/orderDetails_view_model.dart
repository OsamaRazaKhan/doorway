import 'package:doorway/model/SingleOrderDetailsModel.dart';
import 'package:doorway/repository/myBookings_repository.dart';
import 'package:flutter/material.dart';

class OrderdetailsViewModel with ChangeNotifier {
  final _myBookingsRepo = MyBookingsRepository();

  SingleOrderDetailsModel? singleOrderDetails;

  bool _loading = false;
  bool get Loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void initializeMyBookingsData() {
    _loading = true;
    singleOrderDetails = null;
  }

  Future<void> getSingleOrderDetails(dynamic data) async {
    try {
      final value = await _myBookingsRepo.getSingleOrderDetailsApi(data);
      _loading = false;
      if (value['code'] == "201" || value['code'] == 201) {
        if (value['data'] != null) {
          singleOrderDetails = SingleOrderDetailsModel.fromMap(value['data']);
        }
      }
      notifyListeners();
    } catch (error) {
      setLoading(false);
      // Handle the error gracefully
    }
  }
}
