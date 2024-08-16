// para criar alguns objetos das classes que serão usados nos testes
import 'package:cep_app/features/cep/domain/entities/cep_response.dart';
import 'package:cep_app/features/cep/domain/entities/get_ceo_details_by_cep_body.dart';

final tCepObject = CepResponse(
    cep: '31842725',
    logradouro: 'logradouro',
    complemento: 'complemento',
    bairro: 'bairro',
    localidade: 'localidade',
    uf: 'uf');

const tGetCepDetaisByCepRightBody  = GetCeoDetailsByCepBody(cep: '31842725');