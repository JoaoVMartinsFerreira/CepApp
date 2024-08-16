import 'package:cep_app/features/cep/presentation/screens/cep_screen.dart';
import 'package:cep_app/shared/main/cep_config.dart';
import 'package:cep_app/shared/const/cep_app_theme.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_notifier_provider.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CepApp extends StatelessWidget {
  const CepApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (BuildContext _, WidgetRef ref, __) { 
          return MaterialApp(
          title: CepConfig.title,
          theme: CepAppTheme.light,
          darkTheme: CepAppTheme.dark,
          themeMode: ref.watch<ThemeState>(themeNotifierProvider).getTheme, //Assistindo as alterações do getTheme
          home: const CepScreen(),
        );
         },
      ),
    );
  }
}