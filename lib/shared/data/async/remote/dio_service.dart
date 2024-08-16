import 'dart:developer';
import 'dart:io';

import 'package:cep_app/shared/const/consts_Strings.dart';
import 'package:cep_app/shared/data/async/either.dart';

import 'package:cep_app/shared/data/async/remote/erros/api_exception.dart';

import 'package:cep_app/shared/data/models/api_response_model.dart';

import 'api_service.dart';
import 'package:dio/dio.dart';

final class DioService implements ApiService {
  //INJEÇÃO DE  DEPENDÊNCIA
  final Dio _dio;
  DioService(this._dio);
  @override
  Future<Either<ApiException, ApiResponseModel>> get<T>(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final Response(:data, :statusCode, :statusMessage) =
          await _dio.get(endpoint, queryParameters: queryParams);
      return Right(ApiResponseModel<T>(data: data, statusCode: statusCode, message: statusMessage));
    } on SocketException catch (error, st) {
      const identifier = "Socket Exceptionon on Get Request";

      log(identifier, error: error, stackTrace: st);
      return Left(ApiException(
          identifier: identifier,
          statusCode: 1,
          errorStatus: ErrorStatus.noConection,
          message: ConstsStrings.knoInternetConnectionMessage));
    } on DioException catch (dioError, st) {
      const identifier = "Dio Exception on Get Request";

      log(identifier, error: dioError, stackTrace: st);

      return Left(ApiException(
        identifier: identifier,
        statusCode: dioError.response?.statusCode,
        errorStatus: dioError.type == DioExceptionType.connectionError
            ? ErrorStatus.noConection
            : switch (dioError.response?.statusCode) {
                400 => ErrorStatus.badRequest,
                500 => ErrorStatus.internalServerError,
                401 || 403 => ErrorStatus.unauthorized,
                _ => ErrorStatus.unkown
              },
        message: dioError.message ??
            dioError.response?.data?['message'] ??
            ConstsStrings.kDefaultErrorMessage,
      ));
    } catch(e, st){
      const identifier = "GenericException on Get Request";
      log(identifier, error: e, stackTrace: st);

      return Left(
        ApiException(identifier: identifier, statusCode: 3, errorStatus: ErrorStatus.unkown, message: ConstsStrings.kDefaultErrorMessage)
      );
    }
  }
}
