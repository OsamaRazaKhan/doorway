import 'dart:async';
import 'dart:convert';
import 'package:doorway/global.dart';
import 'package:doorway/model/LocationModel.dart';
import 'package:doorway/repository/location_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/utils/utils.dart';
import 'package:doorway/view/handyman_pathway_services/SavedAddresses_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class LocationViewModel with ChangeNotifier {
  LocationModel? selectedLocation;
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

  TextEditingController controller = TextEditingController();
  var uuid = Uuid();
  String sessionToken = '1234';
  List<dynamic> placesList = [];

  CameraPosition? cameraPostion;
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
    cameraPostion = null;
    marker = [];
    addressController = TextEditingController();
    buildingNameController = TextEditingController();
    flatNumberController = TextEditingController();
    nickNameController = TextEditingController();
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
    bool isFlatNoValid = validateAddress(flatNumberController.text);

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
          Navigator.pushReplacement(
              navigatorKey.currentContext!,
              MaterialPageRoute(
                builder: (context) => const HandyManSavedAddresses(
                  wannaPlaceOrder: true,
                ),
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
    final buildingNameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9\s.-]{2,49}$');
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
        cameraPostion = CameraPosition(
            target: LatLng(value.latitude, value.longitude), zoom: 14);
        setMapLoading(false);
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

  void onTextChanged() {
    sessionToken ??= uuid.v4();
    getSuggetion(controller.text);
  }

  void getSuggetion(String input) async {
    String kPLACES_API_KEY = 'AIzaSyAQuR60zRPbDM8NaKa-7HRSp4qTaK7JXfo';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$sessionToken';

    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      placesList = jsonDecode(response.body.toString())["predictions"];
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
