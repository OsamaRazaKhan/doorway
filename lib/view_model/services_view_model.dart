import 'package:doorway/Model/SevicesModel.dart';
import 'package:doorway/global.dart';
import 'package:doorway/repository/services_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/view_model/home_view_model.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesViewModel with ChangeNotifier {
  final _servicesRepo = ServicesRepository();
  List<ServicesModel> servicesList = [];
  ServicesModel? selectedService;

  bool _loading = false;
  bool get Loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSelectedService(ServicesModel value) {
    selectedService = value;
    notifyListeners();
  }

  static void moveToSubServicesScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.jobDetails_view);
  }

  void clearAllStates() {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      navigatorKey.currentContext!,
      listen: false,
    );
    final scheduleViewModel = Provider.of<ScheduleViewModel>(
      navigatorKey.currentContext!,
      listen: false,
    );

    subServicesViewModel.subServicesList.clear();
    subServicesViewModel.selectedIndex = -1;
    subServicesViewModel.images.clear();
    subServicesViewModel.notesController = TextEditingController();
    subServicesViewModel.isSelected = false;
    subServicesViewModel.setSubServicePrice(0.0);
    subServicesViewModel.setLadderOption('No');
    subServicesViewModel.setLadderLength(0);

    scheduleViewModel.setSelectedDay(DateTime.now());
    scheduleViewModel.timings.clear();
    if (scheduleViewModel.selectedTimingIndex != -1) {
      scheduleViewModel.selectedTimingIndex = -1;
    }
  }

  Future<void> GetServices(dynamic data) async {
    try {
      final value = await _servicesRepo.GetServicesListing(data);
      if (value['code'] == "201" || value['code'] == 201) {
        int currentCount = value['data']["total_count"];

        for (int c = 0; c < currentCount; c++) {
          servicesList.add(
            ServicesModel.fromMap(value['data']["services"][c]),
          );
        }
        notifyListeners(); // Debugging output
      }
    } catch (error, stackTrace) {
      // Handle the error gracefully
    }
  }

  void CheckForServices(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    Map<String, dynamic> data = {
      'sub_cat_id': homeViewModel.selectedCategory!.id.toString(),
    };
    if (servicesList.isNotEmpty) {
      if (servicesList[0].subCatId != homeViewModel.selectedCategory!.id) {
        servicesList.clear();
        GetServices(data);
      }
    } else {
      servicesList.clear();
      GetServices(data);
    }
  }
}
