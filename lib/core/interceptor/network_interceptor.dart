import 'package:dio/dio.dart';
import 'package:tezda/core/service/localstorage_service/localstorage_manager/localstorage_manager.dart';
// Access AuthRepoImpl

class NetworkInterceptor extends Interceptor {
  NetworkInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await LocalStorageManager.accessToken;

    if (token != null && !options.path.contains('auth/me')) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    handler.next(response);
  }
}
