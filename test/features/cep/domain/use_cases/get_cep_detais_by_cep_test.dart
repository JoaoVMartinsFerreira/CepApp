import 'package:cep_app/features/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/features/cep/domain/repositories/cep_repository.dart';
import 'package:cep_app/features/cep/domain/use_cases/get_cep_detais_by_cep.dart';
import 'package:cep_app/shared/const/consts_Strings.dart';
import 'package:cep_app/shared/data/async/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/cep_fixtures.dart';
import '../../../../fixtures/mock_cep_repositpry.dart';



void main() {
  late CepRepository cepRepository;
  late GetCepDetaisByCep getCepDetaisByCep;
/**
 * // Para fazer um setup antes de inicializar os testes. Inicializar a classse a ser testada e as classes dependentes
 */
  setUp(() {
    cepRepository = MockCepRepository();
    // cepRepository passado  por injeção de dep. para que ele seja usado no setup e consiga usar alguams implementações quando for chamado no teste
    getCepDetaisByCep = GetCepDetaisByCep(cepRepository);

    registerFallbackValue(tGetCepDetaisByCepRightBody);
  });
  // Criando os testes.


  group('should get cep details by cep', () {
    test('success', () async {
      when(() => cepRepository.getCepDetaisByCep(any()))
          .thenAnswer((_) async => Right(tCepObject));

      final cepResponse = await getCepDetaisByCep(tGetCepDetaisByCepRightBody);

      expect(cepResponse,
          isA<Right>()); // Quando chamar a função, espera que retorna um Right
    });
    test('fail', () async {
      when(() => cepRepository.getCepDetaisByCep(any())).thenAnswer((_) async =>
          Left(CepException(message: ConstsStrings.kDefaultErrorMessage)));
        final cepResponseEither = await getCepDetaisByCep(tGetCepDetaisByCepRightBody);
        expect(cepResponseEither, isA<Left>());
        // cepResponseEither as Left porque é certeza que será retorano um Left  devido ao return, pega o valor do Left, faz um cast como CepException, usa o '.message por ter certeza que a message do when será igual ao do expect.
        expect(((cepResponseEither as Left).value as CepException).message, ConstsStrings.kDefaultErrorMessage);
    });
  });
}
