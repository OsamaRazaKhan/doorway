import 'dart:async';
import 'package:doorway/global.dart';
import 'package:doorway/model/LocationModel.dart';
import 'package:doorway/repository/location_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view/handyman_pathway_services/SavedAddresses_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class LocationViewModel with ChangeNotifier {
  CancelToken? _cancelToken;
  bool? wannaPlaceOrder;

  LocationModel? selectedLocation;
  String? selectedCity;
  final _locationRepo = LocationRepository();
  List<LocationModel> locationsList = [];

  final Completer<GoogleMapController> mainController =
      Completer<GoogleMapController>();

  TextEditingController buildingNameController = TextEditingController();
  TextEditingController flatNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  String latitude = 33.6844.toString();
  String longititude = 73.0479.toString();

  TextEditingController searchController = TextEditingController();
  var uuid = Uuid();
  String sessionToken = '1234';
  List<dynamic> placesList = [];

  CameraPosition? cameraPosition;
  // = const CameraPosition(
  //   target: LatLng(33.6844, 73.0479),
  //   zoom: 16.4746,
  // );
  List<Marker> marker = [];

  bool _isWorking = false;
  bool get isWorking => _isWorking;

  bool _locationsLoading = false;
  bool get locationsLoading => _locationsLoading;

  bool _mapLoading = false;
  bool get mapLoading => _mapLoading;

  setIsWorking(bool value) {
    _isWorking = value;
    notifyListeners();
  }

  setLocationsLoading(bool value) {
    _locationsLoading = value;
    notifyListeners();
  }

  setMapLoading(bool value) {
    _mapLoading = value;
    notifyListeners();
  }

  void reSetLocationListings() {
    locationsList.clear();
  }

  void reSetLocationsLoading() {
    _locationsLoading = true;
  }

  void initializeLocationsData() {
    reSetLocationsLoading();
    reSetLocationListings();
  }

  void initializeLocation() {
    _mapLoading = true;
    cameraPosition = null;
    marker = [];
    placesList = [];
    addressController = TextEditingController();
    buildingNameController = TextEditingController();
    flatNumberController = TextEditingController();
    nickNameController = TextEditingController();
  }

  void clearAddressControllers() {
    addressController.text = '';
    buildingNameController.text = '';
    flatNumberController.text = '';
  }

  static void moveToHandyManView(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.handyMan_view);
  }

  static void moveToSetLocation(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.SelectLocation_view);
  }

  Future<void> addLoction(
    dynamic data,
  ) async {
    bool isAddressValid = validateAddress(addressController.text);
    bool isBuildingNameValid =
        validateBuildingName(buildingNameController.text);
    bool isFlatNoValid = validateFlatNumber(flatNumberController.text);

    if (!isAddressValid) {
      Utils.snackBar(
          'Please enter your valid address', navigatorKey.currentContext!);
    } else if (!isBuildingNameValid) {
      Utils.snackBar('Please enter your valid building name',
          navigatorKey.currentContext!);
    } else if (!isFlatNoValid) {
      Utils.snackBar(
          'Please enter your valid flat no', navigatorKey.currentContext!);
    } else {
      setIsWorking(true);
      setLocationsLoading(true);
      _locationRepo.AddLocationApi(data).then((value) {
        setLocationsLoading(false);
        if (value['code'] == "201" || value['code'] == 201) {
          Navigator.pop(navigatorKey.currentContext!);
          Navigator.pushReplacement(
              navigatorKey.currentContext!,
              MaterialPageRoute(
                builder: (context) => const HandyManSavedAddresses(),
              ));
        }
        Utils.flushBarSuccessMessage(
            value['message'], navigatorKey.currentContext!);
        if (kDebugMode) {
          print(value.toString());
        }
        setIsWorking(false);
      }).onError((error, stackTrace) {
        setLocationsLoading(false);
        // if (kDebugMode) {
        Utils.flushBarErrorMessage(
            error.toString(), navigatorKey.currentContext!);
        setIsWorking(false);
        // }
      });
    }
  }

  Future<void> getLocations(dynamic data) async {
    try {
      final value = await _locationRepo.getLocationsListing(data);
      if (value['code'] == "201" || value['code'] == 201) {
        for (var item in value['data']['locations']) {
          locationsList.add(
            LocationModel.fromMap(item),
          );
        }
        setLocationsLoading(false);
        notifyListeners(); // Debugging output
      }
    } catch (error, stackTrace) {
      setLocationsLoading(false);
      // Handle the error gracefully
    }
  }

  bool validateAddress(String address) {
    final addressRegex = RegExp(r'^[a-zA-Z0-9\s,./#-]{5,100}$');
    return addressRegex.hasMatch(address);
  }

  bool validateBuildingName(String buildingName) {
    final buildingNameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9\s.#-]{2,49}$');
    return buildingNameRegex.hasMatch(buildingName);
  }

  bool validateFlatNumber(String flatNumber) {
    final flatNumberRegex = RegExp(r'^[a-zA-Z0-9/#-]{1,10}$');
    return flatNumberRegex.hasMatch(flatNumber);
  }

  void loadMap() {
    try {
      getUserCurrentLocation().then((value) async {
        marker.add(Marker(
            markerId: MarkerId('1'),
            position: LatLng(value.latitude, value.longitude),
            infoWindow: const InfoWindow(title: '')));
        cameraPosition = CameraPosition(
            target: LatLng(value.latitude, value.longitude), zoom: 14);
        setMapLoading(false);

        await loadAddress(value.latitude, value.longitude);
        notifyListeners();
      });
    } catch (error, stackTrace) {
      setMapLoading(false);
    }
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Future<void> loadAddress(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      // Use specific fields to construct the most accurate full address
      addressController.text = '${place.name}, ${place.subThoroughfare},'
          '${place.subLocality}, ${place.locality}, '
          '${place.administrativeArea}, ${place.postalCode}, ${place.country}';
      buildingNameController.text = place.name.toString();
      flatNumberController.text = '0000';
    }
  }

  void onTextChanged() {
    sessionToken ??= uuid.v4();

    // Cancel the previous API call
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    getSuggetion(searchController.text, _cancelToken!);
  }

  void getSuggetion(String input, CancelToken cancelToken) async {
    if (input.isNotEmpty) {
      String kPLACES_API_KEY = 'AIzaSyAQuR60zRPbDM8NaKa-7HRSp4qTaK7JXfo';
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$sessionToken';

      var response = await Dio().get(request, cancelToken: cancelToken);
      if (response.statusCode == 200) {
        placesList = response.data["predictions"];
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      _cancelToken?.cancel();
      placesList = [];
      notifyListeners();
    }
  }

  navigateToNewLocation(
    double latitude,
    double longitude,
  ) async {
    placesList.clear();
    notifyListeners();

    searchController.text = '';
    marker.clear();
    marker.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(latitude, longitude),
        infoWindow: const InfoWindow(title: '')));
    GoogleMapController controller = await mainController.future;
    cameraPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 14);
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));

    await loadAddress(latitude, longitude);
    notifyListeners();
  }
}
