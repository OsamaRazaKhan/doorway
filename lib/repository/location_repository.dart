import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:doorway/data/network/NetworkApiService.dart';
import 'package:doorway/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepository {
  BasedApiServices _apiServices = NetworkApiService();

  Future<dynamic> AddLocationApi(dynamic data) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String loginToken = sp.getString('loginToken')!;

      var url = AppUrl.baseUrl + AppUrl.createUserLocation;
      var headers = {
        'key': AppUrl.apiKey,
        'token': loginToken,
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getLocationsListing(dynamic data) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String loginToken = sp.getString('loginToken')!;

      var url = AppUrl.baseUrl + AppUrl.userLocationListing;
      var headers = {
        'key': AppUrl.apiKey,
        'token': loginToken,
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
