import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/local/local_service/local_service.dart';
import 'package:cep_app/shared/ui/theme/data/datasources/get_theme_local_datasource.dart';
import 'package:cep_app/shared/ui/theme/errors/theme_local_exception.dart';

abstract interface class SetThemeLocalDatasource {
  Future<Either<ThemeLocalException,void>> setIsLightTheme(bool isLightTheme);
}
final class SetThemeLocalDatasourceImpl implements SetThemeLocalDatasource{
  final  LocalService _localService;

  SetThemeLocalDatasourceImpl(this._localService); // invejeção de depencdência do localService
  @override
  Future<Either<ThemeLocalException, void>> setIsLightTheme(bool isLightTheme) async{
    final isLightThemeEither = await _localService.set(IS_LIGHT_THEME_KEY, isLightTheme);

    switch(isLightThemeEither){
      case Left():
      return Left(ThemeLocalException(message: 'Erro ao trocar o tema'));
      case Right():
      return Right(null);
    }
  }
  
}