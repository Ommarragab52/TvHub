import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/style/app_colors.dart';
import 'package:movies/core/style/app_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme(String languageCode, {bool isDark = true}) {
    return ThemeData(
      fontFamily: _getFontFamily(languageCode),
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDark
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        primary: isDark
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        onPrimary: isDark ? Colors.white : Colors.black,
        surface: isDark ? Colors.white12 : Colors.black12,
        seedColor: isDark
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        surfaceTintColor: isDark
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
      ),
      textTheme: _getTextTheme(isDark),
      cardTheme: CardTheme(
        color: isDark ? Colors.white12 : Colors.black12,
      ),
      switchTheme: _getSwitchTheme(),
      navigationBarTheme: _getNavigationBarTheme(),
      tabBarTheme: const TabBarThemeData(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        dividerColor: Colors.transparent,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }

  static String _getFontFamily(String languageCode) {
    return languageCode == 'ar'
        ? GoogleFonts.cairo().fontFamily!
        : GoogleFonts.poppins().fontFamily!;
  }

  static TextTheme _getTextTheme(bool isDark) {
    return TextTheme(
      titleLarge: AppStyles.style18Bold.copyWith(
        color: isDark ? Colors.white : Colors.black,
      ),
      titleMedium: AppStyles.style16Regular.copyWith(
        color: isDark ? Colors.white : Colors.black,
      ),
      titleSmall: AppStyles.style14Regular.copyWith(
        color: isDark ? Colors.white : Colors.black,
      ),
      bodySmall: AppStyles.style12Regular.copyWith(
        color: isDark ? Colors.white : Colors.black,
      ),
      labelSmall: AppStyles.style14Regular.copyWith(
        fontSize: 11,
      ),
    );
  }

  static SwitchThemeData _getSwitchTheme() {
    return SwitchThemeData(
      trackOutlineColor:
          WidgetStateProperty.resolveWith((states) => Colors.white),
      thumbColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      trackColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? Colors.blueAccent
            : Colors.grey;
      }),
    );
  }

  static NavigationBarThemeData _getNavigationBarTheme() {
    return NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) {
          return states.contains(WidgetState.selected)
              ? AppStyles.style12Regular.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                )
              : AppStyles.style12Regular.copyWith(
                  fontSize: 10,
                  color: Colors.grey,
                );
        },
      ),
    );
  }
}
