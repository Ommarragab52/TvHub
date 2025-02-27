import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/settings/index.dart';
import 'core/index.dart';
import 'l10n/app_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.currentLocale != current.currentLocale ||
          previous.currentTheme != current.currentTheme,
      builder: (context, state) {
        return MaterialApp(
          navigatorKey: SL.navigationService().navigatorKey,
          locale: state.currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: state.currentTheme,
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
