import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPlayingNowUseCase _getPlayingNowUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetUpcomingUseCase _getUpcomingUseCase;
  MoviesBloc(
    this._getPlayingNowUseCase,
    this._getPopularUseCase,
    this._getTopRatedUseCase,
    this._getUpcomingUseCase,
  ) : super(const MoviesState()) {
    on<GetPlayingNowMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetUpcomingMoviesEvent>(_getUpcomingMovies);
    on<RefreshMoviesDataEvent>(_refreshData);
  }

  void _getNowPlayingMovies(
    GetPlayingNowMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(nowPlayingStatus: Status.idle));
    final result = await _getPlayingNowUseCase(page: 1);
    switch (result) {
      case ApiSuccess():
        final movieResponse = (result.data as MovieResponse);

        emit(state.copyWith(
          nowPlayingStatus: Status.success,
          nowPlayingMovies: movieResponse.movies,
        ));
      case ApiError():
        emit(state.copyWith(
          nowPlayingStatus: Status.failure,
          nowPlayingMessageCode: result.faliure.code,
        ));
    }
  }

  void _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(popularStatus: Status.idle));
    final result = await _getPopularUseCase(page: 1);

    switch (result) {
      case ApiSuccess():
        final movieResponse = (result.data as MovieResponse);
        emit(state.copyWith(
          popularStatus: Status.success,
          popularMovies: movieResponse.movies,
        ));
      case ApiError():
        emit(state.copyWith(
          popularStatus: Status.failure,
          popularMessageCode: result.faliure.code,
        ));
    }
  }

  void _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(topRatedStatus: Status.idle));
    final result = await _getTopRatedUseCase(page: 1);

    switch (result) {
      case ApiSuccess():
        final movieResponse = (result.data as MovieResponse);

        emit(state.copyWith(
          topRatedStatus: Status.success,
          topRatedMovies: movieResponse.movies,
        ));
      case ApiError():
        emit(
          state.copyWith(
            topRatedStatus: Status.failure,
            topRatedMessageCode: result.faliure.code,
          ),
        );
    }
  }

  void _getUpcomingMovies(
    GetUpcomingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(upcomingStatus: Status.idle));
    final result = await _getUpcomingUseCase(page: 1);

    switch (result) {
      case ApiSuccess():
        final movieResponse = (result.data as MovieResponse);
        emit(state.copyWith(
          upcomingStatus: Status.success,
          upcomingMovies: movieResponse.movies,
        ));
      case ApiError():
        emit(state.copyWith(
          upcomingStatus: Status.failure,
          upcomingMessageCode: result.faliure.code,
        ));
    }
  }

  _refreshData(
    RefreshMoviesDataEvent event,
    Emitter<MoviesState> emit,
  ) {
    add(GetPlayingNowMoviesEvent());
    add(GetPopularMoviesEvent());
    add(GetTopRatedMoviesEvent());
    add(GetUpcomingMoviesEvent());
  }
}
