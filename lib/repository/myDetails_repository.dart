import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:doorway/data/network/NetworkApiService.dart';
import 'package:doorway/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDetailsRepository {
  BasedApiServices _apiServices = NetworkApiService();

  Future<dynamic> getMyDetailsApi(dynamic data) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String loginToken = sp.getString('loginToken')!;

      var url = AppUrl.baseUrl + AppUrl.updateUserString;
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
