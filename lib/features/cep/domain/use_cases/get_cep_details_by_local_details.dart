import 'package:cep_app/features/cep/domain/entities/cep_response.dart';
import 'package:cep_app/features/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/features/cep/domain/repositories/cep_repository.dart';
import 'package:cep_app/shared/data/async/either.dart';

import '../entities/get_cep_details_by_local_details_body.dart';

class GetCepDetailsByLocalDetails {
  final CepRepository _cepRepository;

  GetCepDetailsByLocalDetails(this._cepRepository);

  Future<Either<CepException, List<CepResponse>>> call(GetCepDetailsByLocalDetailsBody body){
    return _cepRepository.getCepDetailsByLocalDetails(body);
  }
}