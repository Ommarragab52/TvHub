part of 'settings_bloc.dart';

sealed class SettingsEvent {}

class ToggleThemeEvent extends SettingsEvent {}

class ChangeLanguageEvent extends SettingsEvent {
  final String languageCode;
  ChangeLanguageEvent(this.languageCode);
}

class ChangeRegionEvent extends SettingsEvent {
  final String regionCode;
  ChangeRegionEvent(this.regionCode);
}

class InternetConnectivityEvent extends SettingsEvent {
  final bool isConnected;
  final String? errorMessage;
  InternetConnectivityEvent(this.isConnected, {this.errorMessage});
}
