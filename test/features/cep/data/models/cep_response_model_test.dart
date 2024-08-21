
import 'package:cep_app/features/cep/data/models/cep_response_model.dart';
import 'package:cep_app/features/cep/domain/entities/cep_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/cep_fixtures.dart';

void main() {
  test('should convert CepResponseModel into Json', (){
    final cepJson = tCepObject.toJSON();

    expect(cepJson, equals(tcepLocalResponse));
  });

  test('should convert Map to CepResponseModel', (){
    final cepResponse = CepResponseModel.fromMap(tCepApiResponse);

    expect(cepResponse, equals(tCepObject));
  });

  test('should convert JSON to CepResonseModel', (){
    final CepResponse = CepResponseModel.fromJson(tcepLocalResponse);

    expect(CepResponse, equals(tCepObject));
  });
}