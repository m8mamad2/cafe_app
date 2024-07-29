
import 'package:cafe_mobile/src/core/utils/get_token.dart';
import 'package:dio/dio.dart';

class AuthCheckerInterceptor extends Interceptor {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    options.contentType = "application/json";
    bool token = await GetToken.getToken();
    if (token)
      options.headers.addAll({'Authorization': 'Bearer $token'});
    handler.next(options);
  }

  
}
