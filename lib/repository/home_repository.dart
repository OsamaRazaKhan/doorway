import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:doorway/data/network/NetworkApiService.dart';
import 'package:doorway/res/app_url.dart';

class HomeRepository {
  BasedApiServices _apiServices = NetworkApiService();

  Future<dynamic> GetCategoriesListing(dynamic data) async {
    try {
      var url = AppUrl.baseUrl + AppUrl.subCategoriesListing;
      var headers = {
        'key': AppUrl.apiKey,
      };
      dynamic response =
          await _apiServices.getPostApiResponse(url, data, headers: headers);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
