import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/home/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:movies/features/search/index.dart';
import 'package:movies/features/tv_series/index.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  SettingsBloc() : super(SettingsState.init()) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ChangeRegionEvent>(_onChangeRegion);
    on<InternetConnectivityEvent>(_updateInternetConnection);
    connectivityChecker();
  }

  // Toggle Theme
  void _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(themeStatus: Status.idle));
    try {
      // Get current theme
      bool isDark =
          !(SharedPrefHelper.getBool(SharedPrefKeys.isDarkMode) ?? true);

      // Persist theme preference
      SharedPrefHelper.setBool(SharedPrefKeys.isDarkMode, isDark);

      // Recreate theme with current language
      emit(
        state.copyWith(
          themeStatus: Status.success,
          currentTheme: AppTheme.getTheme(
            state.languageCode.substring(0, 2),
            isDark: isDark,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(themeStatus: Status.failure));
    }
  }

  // Change Language
  void _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<SettingsState> emit,
  ) {
    log(event.languageCode);
    emit(state.copyWith(localeStatus: Status.idle));
    try {
      // Persist language preference
      SharedPrefHelper.setString(SharedPrefKeys.language, event.languageCode);
      bool isDark = SharedPrefHelper.getBool(SharedPrefKeys.isDarkMode) ?? true;

      // Update locale language and update theme language
      emit(state.copyWith(
        localeStatus: Status.success,
        themeStatus: Status.success,
        languageCode: event.languageCode,
        currentLocale: Locale(
          event.languageCode.substring(0, 2),
        ),
        currentTheme: AppTheme.getTheme(event.languageCode.substring(0, 2),
            isDark: isDark),
      ));
      log('Language changed to: ${state.languageCode}');
      // Refresh data across app
      refreshAppData();
      SL.context.pop();
    } catch (e) {
      log('Language Change Error: $e');
      emit(state.copyWith(localeStatus: Status.failure));
    }
  }

  // Change Region
  void _onChangeRegion(
    ChangeRegionEvent event,
    Emitter<SettingsState> emit,
  ) {
    try {
      // Persist region preference
      SharedPrefHelper.setString(SharedPrefKeys.region, event.regionCode);

      // Update locale with new region
      emit(
        state.copyWith(
          localeStatus: Status.success,
          regionCode: event.regionCode,
        ),
      );
      log('Region changed to: ${state.regionCode}');

      // Refresh data across app
      refreshAppData();
      SL.context.pop();
    } catch (e) {
      log('Region Change Error: $e');
      emit(state.copyWith(localeStatus: Status.failure));
    }
  }

  // check internet connection
  connectivityChecker() async {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      if (result.first != ConnectivityResult.none) {
        add(InternetConnectivityEvent(true));
      } else {
        add(InternetConnectivityEvent(false));
      }
    }, onError: (e) {
      add(InternetConnectivityEvent(false, errorMessage: e.toString()));
    });
  }

  _updateInternetConnection(
    InternetConnectivityEvent event,
    Emitter<SettingsState> emit,
  ) {
    if (event.errorMessage == null) {
      if (event.isConnected) {
        // Update internet status
        emit(state.copyWith(
          internetStatus: InternetStatus.connected,
        ));
        // Refresh data across app
      } else {
        // Update internet status
        emit(state.copyWith(
          internetStatus: InternetStatus.disconnected,
        ));
      }

      log('Internet Status: ${state.internetStatus}');
    } else {
      emit(
        state.copyWith(
          internetStatus: InternetStatus.failure,
          internetErrorMessage: event.errorMessage,
        ),
      );
      log('Internet Error: ${event.errorMessage}');
    }
    refreshAppData();
  }

// Refresh App Data
  void refreshAppData() {
    DioHelper.updateLanguageAndRegion();
    SL.moviesBloc().add(RefreshMoviesDataEvent());
    SL.tvSeriesBloc().add(RefreshTvDataEvent());
    SL.searchBloc().add(GetTrendingEvent());
    SL.homeBloc().add(ChangeNavBarIndexEvent(0));
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
