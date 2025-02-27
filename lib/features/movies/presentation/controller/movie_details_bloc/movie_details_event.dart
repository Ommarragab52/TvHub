part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;
  GetMovieDetailsEvent(this.movieId);
}

class GetSimilarMoviesEvent extends MovieDetailsEvent {
  final int movieId;
  GetSimilarMoviesEvent(this.movieId);
}

class GetMovieImagesEvent extends MovieDetailsEvent {
  final int movieId;
  GetMovieImagesEvent(this.movieId);
}

class GetMovieVideosEvent extends MovieDetailsEvent {
  final int movieId;
  GetMovieVideosEvent(this.movieId);
}
