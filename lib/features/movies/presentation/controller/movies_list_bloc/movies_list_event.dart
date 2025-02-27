part of 'movies_list_bloc.dart';

sealed class MoviesListEvent {}

class GetPopularMoviesListEvent extends MoviesListEvent {
  final int page;
  GetPopularMoviesListEvent({this.page = 1});
}

class GetTopRatedMoviesListEvent extends MoviesListEvent {
  final int page;
  GetTopRatedMoviesListEvent({this.page = 1});
}
