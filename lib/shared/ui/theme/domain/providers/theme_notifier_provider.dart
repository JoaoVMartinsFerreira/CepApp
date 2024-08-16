import 'package:cep_app/shared/data/local/local_service/shared_preferences_service.dart';
import 'package:cep_app/shared/ui/theme/data/datasources/get_theme_local_datasource.dart';
import 'package:cep_app/shared/ui/theme/data/datasources/set_theme_local_datasource.dart';
import 'package:cep_app/shared/ui/theme/data/repositories/theme_repositoryImpl.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_notifier.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/shared/ui/theme/domain/repositories/theme_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier(ThemeRepositoryImpl(
      GetThemeLocalDatasourceImpl(SharedPreferencesService()),
      SetThemeLocalDatasourceImpl(SharedPreferencesService())));
});
