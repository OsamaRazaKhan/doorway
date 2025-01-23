import 'package:flutter/material.dart';

class MyDetailsViewModel with ChangeNotifier {
  // final _myBookingsRepo = MyBookingsRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController interestedInController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> getSingleOrderDetails(dynamic data) async {
    // try {
    //   final value = await _myBookingsRepo.getSingleOrderDetailsApi(data);
    //   _loading = false;
    //   if (value['code'] == "201" || value['code'] == 201) {
    //     if (value['data'] != null) {
    //       singleOrderDetails = SingleOrderDetailsModel.fromMap(value['data']);
    //     }
    //   }
    //   notifyListeners();
    // } catch (error) {
    //   setLoading(false);
    //   // Handle the error gracefully
    // }
  }
}
