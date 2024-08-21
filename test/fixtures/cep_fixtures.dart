// para criar alguns objetos das classes que serão usados nos testes
import 'package:cep_app/features/cep/data/models/cep_response_model.dart';
import 'package:cep_app/features/cep/domain/entities/get_ceo_details_by_cep_body.dart';
import 'package:cep_app/features/cep/domain/entities/get_cep_details_by_local_details_body.dart';

const Map<String, dynamic> tCepApiResponse = {
  "cep": '31842725',
  "logradouro": 'logradouro',
  "complemento": 'complemento',
  "bairro": 'bairro',
  "localidade": 'localidade',
  "uf": 'uf',
};


final tCepObject = CepResponseModel(
  cep: '31842725',
  logradouro: 'logradouro',
  complemento: 'complemento',
  bairro: 'bairro',
  localidade: 'localidade',
  uf: 'uf',
);
const String tcepLocalResponse =
    '{"cep":"31842725","logradouro":"logradouro","complemento":"complemento","bairro":"bairro","localidade":"localidade","uf":"uf"}';
const tGetCepDetaisByCepRightBody = GetCeoDetailsByCepBody(cep: '31842725');


const tGetCepDetailsByLocalDetailsBodyRight = GetCepDetailsByLocalDetailsBody(
    estado: 'MG', cidade: 'Belo Horizonte', rua: 'Avenida Cristiano Machado');
