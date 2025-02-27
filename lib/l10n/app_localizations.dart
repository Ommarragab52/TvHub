import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @movies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// No description provided for @tv_shows.
  ///
  /// In en, this message translates to:
  /// **'TV Shows'**
  String get tv_shows;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @top_rated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get top_rated;

  /// No description provided for @on_the_air.
  ///
  /// In en, this message translates to:
  /// **'On The Air'**
  String get on_the_air;

  /// No description provided for @search_title.
  ///
  /// In en, this message translates to:
  /// **'Milion of movies and TV shows to discover. Explore now'**
  String get search_title;

  /// No description provided for @trending_today.
  ///
  /// In en, this message translates to:
  /// **'Trending Today'**
  String get trending_today;

  /// No description provided for @episodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// No description provided for @show_all.
  ///
  /// In en, this message translates to:
  /// **'Show All'**
  String get show_all;

  /// No description provided for @similar_tv_shows.
  ///
  /// In en, this message translates to:
  /// **'Similar TV Shows'**
  String get similar_tv_shows;

  /// No description provided for @no_similar_tv_shows.
  ///
  /// In en, this message translates to:
  /// **'No Similar TV Shows'**
  String get no_similar_tv_shows;

  /// No description provided for @similar_movies.
  ///
  /// In en, this message translates to:
  /// **'Similar Movies'**
  String get similar_movies;

  /// No description provided for @trailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get trailer;

  /// No description provided for @no_similar_movies.
  ///
  /// In en, this message translates to:
  /// **'No Similar Movies'**
  String get no_similar_movies;

  /// No description provided for @no_data_found.
  ///
  /// In en, this message translates to:
  /// **'No Data Found'**
  String get no_data_found;

  /// No description provided for @images.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get images;

  /// No description provided for @generes.
  ///
  /// In en, this message translates to:
  /// **'Generes'**
  String get generes;

  /// No description provided for @seasons.
  ///
  /// In en, this message translates to:
  /// **'Seasons'**
  String get seasons;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @apperance.
  ///
  /// In en, this message translates to:
  /// **'Apperance'**
  String get apperance;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get dark_mode;

  /// No description provided for @languages_and_regions.
  ///
  /// In en, this message translates to:
  /// **'Languages and Regions'**
  String get languages_and_regions;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @change_region.
  ///
  /// In en, this message translates to:
  /// **'Change Country'**
  String get change_region;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// No description provided for @help_and_support.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get help_and_support;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @usa.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get usa;

  /// No description provided for @egypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @adventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get adventure;

  /// No description provided for @action_and_adventure.
  ///
  /// In en, this message translates to:
  /// **'Action and Adventure'**
  String get action_and_adventure;

  /// No description provided for @animation.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get animation;

  /// No description provided for @comedy.
  ///
  /// In en, this message translates to:
  /// **'Comedy'**
  String get comedy;

  /// No description provided for @crime.
  ///
  /// In en, this message translates to:
  /// **'Crime'**
  String get crime;

  /// No description provided for @documentary.
  ///
  /// In en, this message translates to:
  /// **'Documentary'**
  String get documentary;

  /// No description provided for @drama.
  ///
  /// In en, this message translates to:
  /// **'Drama'**
  String get drama;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @fantasy.
  ///
  /// In en, this message translates to:
  /// **'Fantasy'**
  String get fantasy;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @horror.
  ///
  /// In en, this message translates to:
  /// **'Horror'**
  String get horror;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @mystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery'**
  String get mystery;

  /// No description provided for @romance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get romance;

  /// No description provided for @science_fiction.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi'**
  String get science_fiction;

  /// No description provided for @tv_movie.
  ///
  /// In en, this message translates to:
  /// **'TV Movie'**
  String get tv_movie;

  /// No description provided for @thriller.
  ///
  /// In en, this message translates to:
  /// **'Thriller'**
  String get thriller;

  /// No description provided for @war.
  ///
  /// In en, this message translates to:
  /// **'War'**
  String get war;

  /// No description provided for @western.
  ///
  /// In en, this message translates to:
  /// **'Western'**
  String get western;

  /// No description provided for @kids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kids;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @reality.
  ///
  /// In en, this message translates to:
  /// **'Reality'**
  String get reality;

  /// No description provided for @science.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get science;

  /// No description provided for @soap.
  ///
  /// In en, this message translates to:
  /// **'Soap'**
  String get soap;

  /// No description provided for @talk.
  ///
  /// In en, this message translates to:
  /// **'Talk'**
  String get talk;

  /// No description provided for @sci_fi_and_fantasy.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi and Fantasy'**
  String get sci_fi_and_fantasy;

  /// No description provided for @war_and_politics.
  ///
  /// In en, this message translates to:
  /// **'War and Politics'**
  String get war_and_politics;

  /// No description provided for @swipe_down_to_refresh.
  ///
  /// In en, this message translates to:
  /// **'Swipe Down to Refresh'**
  String get swipe_down_to_refresh;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get no_internet_connection;

  /// No description provided for @opps_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Opps! Something went wrong'**
  String get opps_something_went_wrong;

  /// No description provided for @connection_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection Timeout'**
  String get connection_timeout;

  /// No description provided for @send_timeout.
  ///
  /// In en, this message translates to:
  /// **'Send Timeout'**
  String get send_timeout;

  /// No description provided for @receive_timeout.
  ///
  /// In en, this message translates to:
  /// **'Receive Timeout'**
  String get receive_timeout;

  /// No description provided for @bad_certificate.
  ///
  /// In en, this message translates to:
  /// **'Bad Certificate'**
  String get bad_certificate;

  /// No description provided for @request_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Request Cancelled'**
  String get request_cancelled;

  /// No description provided for @connection_error.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get connection_error;

  /// No description provided for @bad_request.
  ///
  /// In en, this message translates to:
  /// **'Bad Request'**
  String get bad_request;

  /// No description provided for @unauthorised.
  ///
  /// In en, this message translates to:
  /// **'Unauthorised'**
  String get unauthorised;

  /// No description provided for @forbidden.
  ///
  /// In en, this message translates to:
  /// **'Forbidden'**
  String get forbidden;

  /// No description provided for @not_found.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get not_found;

  /// No description provided for @internal_server_error.
  ///
  /// In en, this message translates to:
  /// **'Internal Server Error'**
  String get internal_server_error;

  /// No description provided for @bad_gateway.
  ///
  /// In en, this message translates to:
  /// **'Bad Gateway'**
  String get bad_gateway;

  /// No description provided for @service_unavailable.
  ///
  /// In en, this message translates to:
  /// **'Service Unavailable'**
  String get service_unavailable;

  /// No description provided for @gateway_timeout.
  ///
  /// In en, this message translates to:
  /// **'Gateway Timeout'**
  String get gateway_timeout;

  /// No description provided for @internet_connected.
  ///
  /// In en, this message translates to:
  /// **'Internet Connected'**
  String get internet_connected;

  /// No description provided for @internet_disconnected.
  ///
  /// In en, this message translates to:
  /// **'Internet Disconnected'**
  String get internet_disconnected;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
