import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiWordKeys {
  ApiWordKeys._();
  static const String englishLanguageCode = 'en-US';
  static const String arabicLanguageCode = 'ar-EG';
  static const String regionUSCode = 'US';
  static const String regionEGCode = 'EG';
}

class ApiConstants {
  ApiConstants._();
  // BASE URL
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static final String apiKey = dotenv.get('APIKEY', fallback: '');
  // IMAGES , VIDEOS ENDPOINTS
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static String getMovieImages(int id) =>
      'https://api.themoviedb.org/3/movie/$id/images';
  static String getTVImages(int id) =>
      'https://api.themoviedb.org/3/tv/$id/images';
  static String getMovieVideos(int id) =>
      'https://api.themoviedb.org/3/movie/$id/videos';
  static String getTVVideos(int id) =>
      'https://api.themoviedb.org/3/tv/$id/videos';
  // MOVIES ENDPOINTS
  static const String playingNowMoviesEP = '/movie/now_playing';
  static const String popularMoviesEP = '/movie/popular';
  static const String topRatedMoviesEP = '/movie/top_rated';
  static const String upcomingMoviesEP = '/movie/upcoming';
  static String movieDetails(int id) => '/movie/$id';
  static String similarMovies(int id) => '${movieDetails(id)}/similar';
  // TV SERIES ENDPOINTS
  static const String airingTodayTVEP = '/tv/airing_today';
  static const String onTheAirTVEP = '/tv/on_the_air';
  static const String topRatedTVEP = '/tv/top_rated';
  static const String popularTVEP = '/tv/popular';
  static String tvDetailsEP(int id) => '/tv/$id';
  static String seasonDetailsEP(int id, int seasonNumber) =>
      '/tv/$id/season/$seasonNumber';
  static String similarTVEP(int id) => '/tv/$id/similar';
  // SEARCH ENDPOINTS
  static const String searchEP = '/search/multi';
  static const String trendingTodayEP = '/trending/all/day';

  static String getImage(String path) => '${ApiConstants.imageBaseUrl}$path';

  static const String noImageFound =
      'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=';
}
