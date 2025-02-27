import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/services/service_locator.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/features/home/presentation/screens/home_layout.dart';
import 'package:movies/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies/features/movies/presentation/controller/movies_list_bloc/movies_list_bloc.dart';
import 'package:movies/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:movies/features/movies/presentation/screens/movies_list_screen.dart';
import 'package:movies/features/settings/presentation/screens/change_language_screen.dart';
import 'package:movies/features/settings/presentation/screens/change_region_screen.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_details_bloc/tv_details_bloc.dart';
import 'package:movies/features/tv_series/presentation/screens/tv_series_details_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SL.moviesBloc()
                // ..add(GetPopularMoviesEvent())
                // ..add(GetPlayingNowMoviesEvent())
                // ..add(GetTopRatedMoviesEvent())
                // ..add(GetUpcomingMoviesEvent()),
                ),
            BlocProvider(create: (context) => SL.tvSeriesBloc()
                // ..add(GetPopularTvSeriesEvent())
                // ..add(GetAiringTodayTvSeriesEvent())
                // ..add(GetOnTheAirTvSeriesEvent())
                // ..add(GetTopRatedTvSeriesEvent()),
                ),
            BlocProvider(
              create: (context) => SL.homeBloc(),
            ),
          ],
          child: const HomeLayout(),
        ),
      );
    case AppRoutes.movieDetailsRoute:
      final movieId = settings.arguments as int;
      return PageRouteBuilder(
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: animation.drive(
            Tween(begin: 0.0, end: 1.0),
          ),
          child: child,
        ),
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => SL.movieDetailsBloc()
            ..add(GetMovieDetailsEvent(movieId))
            ..add(GetSimilarMoviesEvent(movieId))
          // ..add(GetMovieImagesEvent(movieId)),
          ,
          child: const MovieDetailsScreen(),
        ),
      );
    case AppRoutes.moviesListRoute:
      final event = settings.arguments as MoviesListEvent;
      return PageRouteBuilder(
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ),
          ),
          child: child,
        ),
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => SL.moviesListBloc()..add(event),
          child: const MoviesListScreen(),
        ),
      );

    case AppRoutes.tvSeriesDetailsRoute:
      final serieId = settings.arguments as int;
      return PageRouteBuilder(
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: animation.drive(
            Tween(begin: 0.0, end: 1.0),
          ),
          child: child,
        ),
        pageBuilder: (_, __, ___) => BlocProvider(
          create: (context) => SL.tvDetailsBloc()
            ..add(GetTvDetailsEvent(serieId))
            ..add(GetSeasonEpisodesEvent(serieId, 1)),
          child: const TvSeriesDetailsScreen(),
        ),
      );
    case AppRoutes.changeLanguageScreenRoute:
      return PageRouteBuilder(
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ),
          ),
          child: child,
        ),
        pageBuilder: (_, __, ___) => const ChangeLanguageScreen(),
      );
    case AppRoutes.changeRegionScreenRoute:
      return PageRouteBuilder(
        transitionsBuilder: (_, animation, __, child) => SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ),
          ),
          child: child,
        ),
        pageBuilder: (_, __, ___) => const ChangeRegionScreen(),
      );
  }
  return null;
}
