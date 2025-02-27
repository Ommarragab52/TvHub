import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/core/helpers/dio_helper.dart';
import 'package:movies/core/services/navigation_service.dart';
import 'package:movies/features/movies/domain/usecases/get_movie_images_usecase.dart';
import 'package:movies/features/search/data/datasoures/remote_data_sources.dart';
import 'package:movies/features/search/data/repository/search_repository_impl.dart';
import 'package:movies/features/search/domain/repository/search_repository.dart';
import 'package:movies/features/search/domain/usecases/get_search_result_usecase.dart';
import 'package:movies/features/search/domain/usecases/get_trending_usecase.dart';
import 'package:movies/features/search/presentation/controller/search_bloc/search_bloc.dart';
import 'package:movies/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:movies/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies/features/movies/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movies/features/movies/domain/usecases/get_upcoming_usecase.dart';
import 'package:movies/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies/features/movies/data/datasource/remote/remote_data_source.dart';
import 'package:movies/features/movies/data/repository/movies_repository_impl.dart';
import 'package:movies/features/movies/domain/reopository/movies_repository.dart';
import 'package:movies/features/movies/domain/usecases/get_playing_now_use_case.dart';
import 'package:movies/features/movies/domain/usecases/get_popular_use_case.dart';
import 'package:movies/features/movies/domain/usecases/get_top_rated_use_case.dart';
import 'package:movies/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies/features/movies/presentation/controller/movies_list_bloc/movies_list_bloc.dart';
import 'package:movies/features/settings/index.dart';
import 'package:movies/features/tv_series/data/datasource/remote/remote_data_source.dart';
import 'package:movies/features/tv_series/data/repository/tv_series_repository_impl.dart';
import 'package:movies/features/tv_series/domain/repository/tv_series_respository.dart';
import 'package:movies/features/tv_series/domain/usecases/get_airing_today_tv_series_usecase.dart';
import 'package:movies/features/tv_series/domain/usecases/get_on_the_air_tv_series_usecase.dart';
import 'package:movies/features/tv_series/domain/usecases/get_popular_tv_series_usecase.dart';
import 'package:movies/features/tv_series/domain/usecases/get_similar_tv_series_usecase.dart';
import 'package:movies/features/tv_series/domain/usecases/get_top_reated_tv_series_usecase.dart';
import 'package:movies/features/tv_series/domain/usecases/get_tv_season_episodes_usecase.dart';
import 'package:movies/features/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_details_bloc/tv_details_bloc.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_bloc.dart';

import '../../features/movies/domain/usecases/get_movie_videos_usecase.dart';

class SL {
  SL._();

  static GetIt get getIt => GetIt.instance;
  static setupServiceLocator() {
    // Dio
    getIt.registerLazySingleton<Dio>(() => DioHelper.getDio());

    ////////////////////////////// M O V I E S //////////////////////////////

    // MOVIES Remote Data Source
    getIt.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(getIt()),
    );
    // MOVIES Repository
    getIt.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(getIt()),
    );
    // MOVIES Usecases
    getIt.registerLazySingleton(() => GetPlayingNowUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUpcomingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetSimilarMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieImagesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieVideosUseCase(getIt()));
    // MOVIES Blocs
    getIt.registerLazySingleton(() => HomeBloc());
    getIt.registerLazySingleton(
      () => MoviesBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    );
    getIt.registerFactory(
      () => MovieDetailsBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    );
    getIt.registerFactory(
      () => MoviesListBloc(
        getIt(),
        getIt(),
      ),
    );

    ////////////////////////////// S E A R C H //////////////////////////////

    // SEARCH Remote Data Source
    getIt.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(getIt()),
    );
    // SEARCH Repository
    getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt()),
    );
    // SEARCH Usecase
    getIt.registerLazySingleton(() => GetSearchResultUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTrendingUsecase(getIt()));
    // SEARCH Blocs
    getIt.registerLazySingleton(
      () => SearchBloc(
        getIt(),
        getIt(),
      ),
    );

    ////////////////////////////// T V - S E R I E S //////////////////////////////

    // TV-SERIES Remote Data Source
    getIt.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(getIt()),
    );
    // TV-SERIES Repository
    getIt.registerLazySingleton<TvSeriesRepository>(
      () => TvSeriesRepositoryImpl(getIt()),
    );
    // TV-SERIES Usecase
    getIt.registerLazySingleton(() => GetAiringTodayTvSeriesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetOnTheAirTvSeriesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetPopularTvSeriesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedTvSeriesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTvSeriesDetailsUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTvSeasonEpisodesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetSimilarTvSeriesUsecase(getIt()));
    // TV-SERIES Blocs
    getIt.registerLazySingleton(
      () => TvSeriesBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    );
    getIt.registerFactory(
      () => TvDetailsBloc(
        getIt(),
        getIt(),
        getIt(),
      ),
    );

    // NAVIGATION SERVICE
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  }

  static MoviesBloc moviesBloc() => getIt.get<MoviesBloc>();
  static MovieDetailsBloc movieDetailsBloc() => getIt.get<MovieDetailsBloc>();
  static MoviesListBloc moviesListBloc() => getIt.get<MoviesListBloc>();
  static TvSeriesBloc tvSeriesBloc() => getIt.get<TvSeriesBloc>();
  static TvDetailsBloc tvDetailsBloc() => getIt.get<TvDetailsBloc>();
  static SearchBloc searchBloc() => getIt.get<SearchBloc>();
  static SettingsBloc settingsBloc() => getIt.get<SettingsBloc>();
  static HomeBloc homeBloc() => getIt.get<HomeBloc>();
  static NavigationService navigationService() =>
      getIt.get<NavigationService>();
  static BuildContext get context => navigationService().context!;
}
