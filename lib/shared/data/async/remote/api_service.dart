import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/async/remote/erros/api_exception.dart';

import '../../models/api_response_model.dart';

abstract interface class ApiService{
  Future<Either<ApiException, ApiResponseModel>> get<T>(String endpoint, {Map<String,dynamic>? queryParams});
}