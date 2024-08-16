import 'dart:developer';

import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/local/local_service/errors/local_exception.dart';
import 'package:cep_app/shared/data/local/local_service/local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalService{
  @override
  Future<Either<LocalException, T?>> get<T>(String key) async{
    try {
      final instance = await SharedPreferences.getInstance();
      if(T == String){
        return Right(instance.getString(key) as T?);
      }else if(T == bool){
        Right(instance.getBool(key) as T?);
      }

      return Right(null);
    } catch (erro, st) {
      log('Error loading local String or bool', error: erro, stackTrace: st);
      return Left(const LocalException(message: 'Error  loading cache. Try again.'));
    }
  }

  @override
  Future<Either<LocalException, void>> set<T>(String key, T data) async{
    
    try {
      final instance = await SharedPreferences.getInstance();
      if(T == String){
        await instance.setString(key, data as  String);
      }else if(T == bool){
        await instance.setBool(key, data as bool);
      }
      return Right(null);
    } catch (error, st) {
      log('Error setting local String of bool', error: error, stackTrace: st);
      return Left(const LocalException(message: 'Error setting cache. Try again'));
    }
  }
  
}