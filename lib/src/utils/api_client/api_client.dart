import 'package:dio/dio.dart';
import 'package:game_lovers/src/utils/api_client/api_exception.dart';

class APIClient {
  Dio? _dio;

  BaseOptions options = BaseOptions(
    baseUrl: 'https://api.igdb.com/v4',

  );

  Dio instance() => _dio!;

  APIClient() {
    _dio ??= Dio(options);
    _dio!.interceptors.add(QueuedInterceptorsWrapper(
      onError: (DioError error, ErrorInterceptorHandler handler) async {
        handler.reject(APIException(error));
      },
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) async {
        options.headers["Client-ID"] = 'piv6anqksxeayy4bh4c3suo7p7s4cl';
        options.headers["Authorization"] = 'Bearer qse8ft1ra2c9ei6d9searwfv3v8l1d';
        options.headers["Accept"] = 'application/json';
        handler.next(options);
      }
    ));
  }

  static Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final client = APIClient();
    return client.instance().put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final client = APIClient();
    return client.instance().get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<Response<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final client = APIClient();
    return client.instance().patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final client = APIClient();
    return client.instance().post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final client = APIClient();
    return client.instance().put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<Response<T>> request<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final client = APIClient();
    return client.instance().request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}