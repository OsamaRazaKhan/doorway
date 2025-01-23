import 'dart:convert';
import 'dart:io';
import 'package:doorway/global.dart';
import 'package:doorway/Model/SubServiceModel.dart';
import 'package:doorway/repository/subServices_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/view_model/services_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SubServicesViewModel with ChangeNotifier {
  final _subServicesRepo = SubservicesRepository();

  TextEditingController notesController = TextEditingController();

  List<SubServiceModel> subServicesList = [];
  int selectedIndex = -1;

  List<File> images = [];
  List<String> imagesBase64 = [];
  ImagePicker imagePicker = ImagePicker();

  bool isSelected = false;

  double _price = 0.0;
  double get Price => _price;

  bool _loading = false;
  bool get Loading => _loading;

  String _selectedLadderOption = 'No';
  String get SelectedLadderOption => _selectedLadderOption;

  int _selectedLadderLength = 0;
  int get SelectedLadderLength => _selectedLadderLength;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSubServicePrice(double value) {
    _price = value;
  }

  setLadderOption(
    String option,
  ) {
    _selectedLadderOption = option;
    if (option == 'No') {
      setLadderLength(0);
    } else if (option == 'Yes - 6ft') {
      setLadderLength(6);
    } else {
      setLadderLength(8);
    }
    notifyListeners();
  }

  setLadderLength(int length) {
    _selectedLadderLength = length;
  }

  setSelectedSubService(int index) {
    for (int i = 0; i < subServicesList.length; i++) {
      if (i == index) {
        selectedIndex = index;
        isSelected = true;
        subServicesList[i].isSelected = true;
      } else {
        subServicesList[i].isSelected = false;
      }
    }
    setSubServicePrice(double.parse(subServicesList[selectedIndex].price!));
    notifyListeners();
  }

  void moveToJobDetailsOtherInfo(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.JobDetailsOtherInfo_view,
    );
  }

  void moveToJobSchedule(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.JobSchedule_view,
    );
  }

  void pickImage(BuildContext context) async {
    final List<XFile> imagesList = await imagePicker.pickMultiImage();

    for (var element in imagesList) {
      File newImage = File(element.path);
      images.add(newImage);
      String base64Image = _encodeImageToBase64(newImage);
      imagesBase64.add(base64Image);
    }
    notifyListeners();
  }

  String _encodeImageToBase64(File imageFile) {
    // Read the image file as bytes
    List<int> imageBytes = imageFile.readAsBytesSync();
    // Encode to Base64
    String base64String = base64Encode(imageBytes);
    // Return in the desired format
    return "data:image/jpeg;base64,$base64String";
  }

  void removeImage(int index) async {
    images.removeAt(index);
    notifyListeners();
  }

  Future<void> GetSubServices(dynamic data) async {
    try {
      // final value = await _subServicesRepo.GetSubServicesListing(data);
      // if (value['code'] == "201" || value['code'] == 201) {
      //   int currentCount = value['data']["total_count"];
      //   for (int c = 0; c < currentCount; c++) {
      //     subServicesList.add(
      //       SubServiceModel.fromMap(value['data']["services"][c]),
      //     );
      //   }
      //   notifyListeners(); // Debugging output
      // }
      final servicesViewModel = Provider.of<ServicesViewModel>(
          navigatorKey.currentContext!,
          listen: false);
      isSelected = false;
      subServicesList.clear();
      if (servicesViewModel.selectedService!.hasSubService == '1') {
        for (var subservice in servicesViewModel.selectedService!.subServices) {
          subServicesList.add(SubServiceModel.fromMap(subservice.toMap()));
        }
      }
    } catch (error, stackTrace) {
      // Handle the error gracefully
    }
  }

  void CheckForSubServices(BuildContext context) {
    // final servicesViewModel =
    //     Provider.of<ServicesViewModel>(context, listen: false);
    // final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    // Map<String, dynamic> data = {
    //   'sub_cat_id': homeViewModel.selectedCategory!.id.toString(),
    // };
    // if (subServicesList.isNotEmpty) {
    //   if (subServicesList[0].serviceId !=
    //       servicesViewModel.selectedService!.id) {
    //     subServicesList.clear();
    //     GetSubServices(data);
    //   }
    // } else {
    //   subServicesList.clear();
    GetSubServices(null);
    // }
  }
}
