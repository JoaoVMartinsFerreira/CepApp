// abstract iterface porque vai ser idependednte tando da apresentação quando da parete de data
import 'package:cep_app/features/cep/domain/entities/cep_response.dart';
import 'package:cep_app/features/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/shared/data/async/either.dart';

import '../entities/get_ceo_details_by_cep_body.dart';

abstract interface class CepRepository {
  Future<Either<CepException, CepResponse>> getCepDetaisByCep(
      GetCeoDetailsByCepBody body);
}
