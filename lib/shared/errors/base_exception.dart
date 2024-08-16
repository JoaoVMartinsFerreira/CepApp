import 'package:cep_app/shared/const/consts_Strings.dart';

base class BaseException implements Exception {
  final String message;

  const BaseException({String? message})
      : message = message ?? ConstsStrings.kDefaultErrorMessage;
}
