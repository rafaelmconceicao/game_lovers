import 'package:dio/dio.dart';

class APIException extends DioError {
  final String errorType;
  @override
  final String message;

  APIException(
    DioError e,
    {
      String? errorType,
      String? customMessage,
    }
  ) :
    message = customMessage ?? (e.response?.data != null ? e.response?.data['message'] : null) ?? e.error.toString(),
    errorType = errorType ?? (e.response?.data != null ? e.response?.data['error'] : null) ?? e.error.toString(),
    super(requestOptions: e.requestOptions, response: e.response, error: e.error);
}