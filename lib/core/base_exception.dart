import 'package:get/get_connect/http/src/status/http_status.dart';

class BaseException implements Exception {
  const BaseException({this.message, this.status, this.statusCode});

  final HttpStatus? status;
  final int? statusCode;
  final String? message;
}
