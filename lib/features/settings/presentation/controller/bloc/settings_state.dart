part of 'settings_bloc.dart';

class SettingsState {
  final String languageCode;
  final String regionCode;
  // Internet Checker State
  final InternetStatus internetStatus;
  final String? internetErrorMessage;
  // Themes State
  final Status themeStatus;
  final ThemeData? currentTheme;
  // Locale State
  final Status localeStatus;
  final Locale? currentLocale;

  const SettingsState._({
    this.languageCode = ApiWordKeys.englishLanguageCode,
    this.regionCode = ApiWordKeys.regionUSCode,
    this.internetStatus = InternetStatus.idle,
    this.internetErrorMessage,
    this.themeStatus = Status.idle,
    this.currentTheme,
    this.localeStatus = Status.idle,
    this.currentLocale,
  });
  factory SettingsState.init() {
// Get current language and region
    String currentLanguageCode =
        SharedPrefHelper.getString(SharedPrefKeys.language) ??
            ApiWordKeys.englishLanguageCode;
    String currentRegionCode =
        SharedPrefHelper.getString(SharedPrefKeys.region) ??
            ApiWordKeys.regionUSCode;
    // Get current theme
    bool isDark = SharedPrefHelper.getBool(SharedPrefKeys.isDarkMode) ?? true;

    log('Current Language Code: $currentLanguageCode');
    log('Current Region Code: $currentRegionCode');
    log('Is Dark Mode: $isDark');

    return SettingsState._(
      languageCode: currentLanguageCode,
      regionCode: currentRegionCode,
      internetStatus: InternetStatus.idle,
      internetErrorMessage: null,
      localeStatus: Status.idle,
      themeStatus: Status.idle,
      currentLocale:
          Locale(currentLanguageCode.substring(0, 2), currentRegionCode),
      currentTheme: AppTheme.getTheme(
        currentLanguageCode.substring(0, 2),
        isDark: isDark,
      ),
    );
  }

  SettingsState copyWith({
    InternetStatus? internetStatus,
    String? internetErrorMessage,
    Status? themeStatus,
    ThemeData? currentTheme,
    Status? localeStatus,
    Locale? currentLocale,
    String? languageCode,
    String? regionCode,
  }) {
    return SettingsState._(
      internetStatus: internetStatus ?? this.internetStatus,
      internetErrorMessage: internetErrorMessage ?? this.internetErrorMessage,
      themeStatus: themeStatus ?? this.themeStatus,
      currentTheme: currentTheme ?? this.currentTheme,
      localeStatus: localeStatus ?? this.localeStatus,
      currentLocale: currentLocale ?? this.currentLocale,
      languageCode: languageCode ?? this.languageCode,
      regionCode: regionCode ?? this.regionCode,
    );
  }

  @override
  String toString() {
    return '''SettingsState {
      languageCode: $languageCode,
      regionCode: $regionCode,
      internetStatus: $internetStatus,
      internetErrorMessage: $internetErrorMessage,
      themeStatus: $themeStatus,
      currentTheme: $currentTheme,
      localeStatus: $localeStatus,
      currentLocale: $currentLocale,
    }''';
  }
}
