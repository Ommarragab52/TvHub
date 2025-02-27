import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

part 'movies_list_event.dart';
part 'movies_list_state.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final GetPopularUseCase _getPopularUseCase;
  final GetTopRatedUseCase _getTopRatedUseCase;
  MoviesListEvent? _currentEvent;
  MoviesListBloc(this._getPopularUseCase, this._getTopRatedUseCase)
      : super(MoviesListState()) {
    on<GetPopularMoviesListEvent>(_getPopluarMoviesList);
    on<GetTopRatedMoviesListEvent>(_getTopRatedMoviesList);
  }
  MoviesListEvent? get currentEvent => _currentEvent;

  void _getPopluarMoviesList(
    GetPopularMoviesListEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    _currentEvent = event;
    if (event.page == state.page) {
      emit(state.copyWith(moviesListStatus: Status.idle));
    }
    final result = await _getPopularUseCase(page: event.page);

    switch (result) {
      case ApiSuccess():
        final movieResponse = (result.data as MovieResponse);
        final movies = List<Movie>.from(state.moviesList)
          ..addAll(movieResponse.movies);
        emit(
          state.copyWith(
            moviesListStatus: Status.success,
            moviesList: movies,
            title: getTitle(event),
            page: movieResponse.page,
            totalPage: movieResponse.totalPages,
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            moviesListStatus: Status.failure,
            errorMessageCode: result.faliure.code,
          ),
        );
    }
  }

  void _getTopRatedMoviesList(
    GetTopRatedMoviesListEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    _currentEvent = event;
    if (event.page == state.page) {
      emit(state.copyWith(moviesListStatus: Status.idle));
    }
    final result = await _getTopRatedUseCase(page: event.page);
    switch (result) {
      case ApiSuccess():
        final movieResponse = (result.data as MovieResponse);
        List<Movie> movies = List.from(state.moviesList)
          ..addAll(movieResponse.movies);
        emit(
          state.copyWith(
            moviesListStatus: Status.success,
            moviesList: movies,
            title: getTitle(event),
            page: movieResponse.page,
            totalPage: movieResponse.totalPages,
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            moviesListStatus: Status.failure,
            errorMessageCode: result.faliure.code,
          ),
        );
    }
  }

  String getTitle(MoviesListEvent event) {
    switch (event) {
      case GetPopularMoviesListEvent():
        return SL.context.loc.popular;
      case GetTopRatedMoviesListEvent():
        return SL.context.loc.top_rated;
    }
  }
}
