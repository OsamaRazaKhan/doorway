import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:doorway/data/app_exceptions.dart';
import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BasedApiServices {
  @override
  Future getGetApiResponnse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw CustomTimeoutException('Something went wrong');
    } on HandshakeException {
      throw CustomHandShakeException('Something went wrong');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data, {dynamic headers}) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), headers: headers, body: data)
              .timeout(const Duration(seconds: 20));
      print(response);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw CustomTimeoutException('Something went wrong');
    } on HandshakeException {
      throw CustomHandShakeException('Something went wrong');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        String message = responseJson['message'] ?? 'Not found';
        throw BadRequestException(message);

      case 404:
        dynamic responseJson = jsonDecode(response.body);
        String message = responseJson['message'] ?? 'Not found';
        throw UnauthorisedException(message);

      case 409:
        dynamic responseJson = jsonDecode(response.body);
        String message = responseJson['message'] ?? 'Not found';
        throw ConflictException(message);

      case 500:
      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with satus code' +
                response.statusCode.toString());
    }
  }
}
