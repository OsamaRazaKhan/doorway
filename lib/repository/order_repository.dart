import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:doorway/data/network/NetworkApiService.dart';
import 'package:doorway/res/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepository {
  BasedApiServices _apiServices = NetworkApiService();

  Future<dynamic> PlaceOrderApi(dynamic data) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String loginToken = sp.getString('loginToken')!;

      var url = AppUrl.baseUrl + AppUrl.orders;
      var headers = {
        'key': AppUrl.apiKey,
        'token': loginToken,
        'Content-Type': 'application/json',
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
