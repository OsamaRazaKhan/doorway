import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:doorway/data/app_exceptions.dart';
import 'package:doorway/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BasedApiServices {
  @override
  Future getGetApiResponnse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
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
      http.Response response;

      // Check if data contains MultipartFile (meaning it's a file upload)
      if (data.values.any((value) => value is http.MultipartFile)) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // Add headers if provided
        if (headers != null) {
          request.headers.addAll(headers.cast<String, String>());
        }

        // Add fields and files separately
        data.forEach((key, value) {
          if (value is http.MultipartFile) {
            request.files.add(value);
          } else {
            request.fields[key] = value.toString();
          }
        });

        // Send multipart request and get response
        var streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      } else {
        // Normal JSON request
        response = await http
            .post(
              Uri.parse(url),
              headers: headers,
              body: data,
            )
            .timeout(const Duration(seconds: 30));
      }

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
