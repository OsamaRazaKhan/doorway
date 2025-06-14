import 'dart:convert';
import 'dart:io';

import 'package:doorway/data/app_exceptions.dart';
import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BasedApiServices {
  @override
  Future getGetApiResponnse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(
    String url,
    dynamic data,
  ) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 15));

      responseJson = returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with satus code' +
                response.statusCode.toString());
    }
  }
}
