import 'package:cep_app/features/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/features/cep/domain/repositories/cep_repository.dart';
import 'package:cep_app/features/cep/domain/use_cases/get_cep_details_by_local_details.dart';
import 'package:cep_app/shared/const/consts_Strings.dart';
import 'package:cep_app/shared/data/async/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/cep_fixtures.dart';
import '../../../fixtures/mock_cep_repositpry.dart';

void main() {
  late CepRepository mockCepRepository;
  late GetCepDetailsByLocalDetails getCepDetailsByLocalDetails;

  setUp(() {
    mockCepRepository = MockCepRepository();
    getCepDetailsByLocalDetails =
        GetCepDetailsByLocalDetails(mockCepRepository);

    registerFallbackValue(tGetCepDetailsByLocalDetailsBodyRight);
  });

  group('should get cep details byy local details', () {
    test('sucess', () async {
      when(() => mockCepRepository.getCepDetailsByLocalDetails(any()))
          .thenAnswer((_) async => Right([
                tCepObject
              ])); // É uma lista porque a resposta da API é uma lista

      final listOfCepResponse = await getCepDetailsByLocalDetails(
          tGetCepDetailsByLocalDetailsBodyRight);
      expect(listOfCepResponse,
          isA<Right>()); // Espera que a lista seja o lado direito do Either
    });

    test('fail', () async {
      when(
        () => mockCepRepository.getCepDetailsByLocalDetails(any()),
      ).thenAnswer(
        (_) async => Left(
          CepException(message: ConstsStrings.kDefaultErrorMessage),
        ),
      );

      final listOfCepResponse = await getCepDetailsByLocalDetails(
          tGetCepDetailsByLocalDetailsBodyRight);

      expect(listOfCepResponse, isA<Left>());

      expect((((listOfCepResponse as Left).value) as CepException).message,
          ConstsStrings.kDefaultErrorMessage);
    });
  });
}
