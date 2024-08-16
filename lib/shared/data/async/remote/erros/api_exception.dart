import '../../../models/api_base_model.dart';

enum ErrorStatus{
  unauthorized,
  noConection,
  badRequest,
  internalServerError,
  unkown
}

final class ApiException extends ApiBaseModel implements Exception{
  final String identifier;
  final ErrorStatus errorStatus;

  ApiException({
    required this.identifier,
    super.message,
    required super.statusCode,
    required this.errorStatus
  });
}