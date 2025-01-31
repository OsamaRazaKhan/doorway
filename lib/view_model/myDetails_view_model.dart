import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:doorway/global.dart';
import 'package:doorway/model/user_details_model.dart';
import 'package:doorway/repository/myDetails_repository.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyDetailsViewModel with ChangeNotifier {
  XFile? image;
  final picker = ImagePicker();

  final _userDeatilsRepo = UserDetailsRepository();

  UserDetailsModel? userDetails;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool _imageLoading = false;
  bool get imageLoading => _imageLoading;

  setImageLoading(bool value) {
    _imageLoading = value;
    notifyListeners();
  }

  Future<void> getUserDetails(dynamic data) async {
    try {
      final value = await _userDeatilsRepo.getUserDetailsApi(data);
      _imageLoading = false;
      if (value['code'] == "201" || value['code'] == 201) {
        if (value['data'] != null) {
          userDetails = UserDetailsModel.fromMap(value['data']['user_details']);
          nameController.text = userDetails!.name!;
          emailController.text = userDetails!.email!;
          phoneController.text = userDetails!.phone!;
        }
      }
      notifyListeners();
    } catch (error) {
      setImageLoading(false);
      // Handle the error gracefully
    }
  }

  Future<void> updateUserDetails(
    dynamic data,
  ) async {
    setImageLoading(true);
    _userDeatilsRepo.updateUserDetails(data).then((value) {
      if (value['code'] == "201" || value['code'] == 201) {
        final userViewModel = Provider.of<UserViewModel>(
            navigatorKey.currentContext!,
            listen: false);
        userViewModel.loginUser!.photo = value['data']['user']['photo'];
      }
      setImageLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setImageLoading(false);
      // if (kDebugMode) {
      Utils.flushBarErrorMessage(
          error.toString(), navigatorKey.currentContext!);
      // }
    });
  }

  dynamic getUserDetailsInstance(BuildContext context) {
    Map data = {
      "name": nameController.text,
      "phone": phoneController.text,
      "username": nameController.text,
      "photo": "https://doorway.logic-valley.com/uploads/defaults/app_user.png"
    };
    return jsonEncode(data);
  }

  Future<void> pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final userViewModel = Provider.of<UserViewModel>(
          navigatorKey.currentContext!,
          listen: false);
      Map data = {
        "name": userViewModel.loginUser!.name,
        "photo": await http.MultipartFile.fromPath('photo', image!.path)
      };
      updateUserDetails(data);
    }
  }
}
