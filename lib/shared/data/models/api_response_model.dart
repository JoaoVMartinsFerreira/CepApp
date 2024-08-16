import 'package:cep_app/shared/data/models/api_base_model.dart';

final class ApiResponseModel<T> extends ApiBaseModel {
  final T data; // Tipo genérico por conta dos dados variados que podem vir da API.

  const ApiResponseModel({
    required this.data,
    super.message,
    required super.statusCode,
  });
}