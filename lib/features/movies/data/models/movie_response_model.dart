import 'package:movies/features/movies/index.dart';

class MovieResponseModel extends MovieResponse {
  MovieResponseModel({
    required super.page,
    required super.totalPages,
    required super.movies,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieResponseModel(
      page: json['page'],
      movies: List<MovieModel>.from(
        (json['results'] as List).map(
          (movieJson) => MovieModel.fromJson(movieJson),
        ),
      ),
      totalPages: json['total_pages'],
    );
  }
}
