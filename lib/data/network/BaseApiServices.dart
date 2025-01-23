abstract class BasedApiServices {
  Future<dynamic> getGetApiResponnse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data,
      {dynamic headers});
}
