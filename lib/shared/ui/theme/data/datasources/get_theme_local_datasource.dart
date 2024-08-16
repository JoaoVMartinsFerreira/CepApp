import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/local/local_service/errors/local_exception.dart';
import 'package:cep_app/shared/data/local/local_service/local_service.dart';
import 'package:cep_app/shared/ui/theme/errors/theme_local_exception.dart';

abstract interface class GetThemeLocalDatasource {
  Future<Either<ThemeLocalException, bool>> getIsLightTheme();
}
const IS_LIGHT_THEME_KEY = 'GET_IS_LIGHT_THEME_KEY';
final class GetThemeLocalDatasourceImpl implements GetThemeLocalDatasource{

  // injeção d  e depenência porque a classe vai depender do LocalService. 
    //Através do contrutor, o local Service é injetado.
    final LocalService _localService;
      GetThemeLocalDatasourceImpl(this._localService);
  @override
  Future<Either<ThemeLocalException,bool>> getIsLightTheme() async{
    final isLightTheme = await _localService.get<bool>(IS_LIGHT_THEME_KEY); // para pegar o valor os isLightTheme.
    
    switch(isLightTheme){
        case Left():
      return Left(ThemeLocalException(message: 'Erro ao trocar o tema'));
        case Right(value: final r):
      return Right(r ?? true);
    }
  }
  
}