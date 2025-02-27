import 'package:movies/features/movies/domain/entities/movie.dart';

class MovieResponse {
  final int page;
  final List<Movie> movies;
  final int totalPages;

  MovieResponse({
    required this.page,
    required this.movies,
    required this.totalPages,
  });
}
