import 'package:cep_app/features/cep/domain/entities/cep_response.dart';
import 'package:cep_app/features/cep/domain/entities/get_ceo_details_by_cep_body.dart';
import 'package:cep_app/features/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/shared/data/async/either.dart';

import '../repositories/cep_repository.dart';

class GetCepDetaisByCep {
  final CepRepository _repository;

 GetCepDetaisByCep(this._repository);
 
 // Vai ser chamado quando innvocar a função no teste
  Future<Either<CepException, CepResponse>> call(GetCeoDetailsByCepBody body){
    return _repository.getCepDetaisByCep(body);
  } 

  
}