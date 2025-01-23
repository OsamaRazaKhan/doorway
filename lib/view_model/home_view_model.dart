import 'package:doorway/Model/CategoriesModel.dart';
import 'package:doorway/repository/home_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();
  List<CategoriesModel> categoriesList = [];
  CategoriesModel? selectedCategory;

  bool _loading = false;
  bool get Loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSelectedCategory(CategoriesModel value) {
    selectedCategory = value;
    notifyListeners();
  }

  static void moveToCategoriesScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.categories_screen);
  }

  static void moveToBookingOrderListingScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.myBookings_screen);
  }

  static void moveToMyAccountScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.myAccount_screen);
  }

  static void moveToSavedAddresses(BuildContext context, dynamic arguments) {
    Navigator.pushNamed(context, RoutesName.SavedAddresses_view,
        arguments: arguments);
  }

  Future<void> GetCategories(dynamic data) async {
    try {
      final value = await _homeRepo.GetCategoriesListing(data);
      if (value['code'] == "201" || value['code'] == 201) {
        categoriesList.clear();
        int currentCount = value['data']["total_count"];

        for (int c = 0; c < currentCount; c++) {
          categoriesList.add(
            CategoriesModel.fromMap(value['data']["subcategories"][c]),
          );
        }
        notifyListeners(); // Debugging output
      }
    } catch (error, stackTrace) {
      // Handle the error gracefully
    }
  }
}
