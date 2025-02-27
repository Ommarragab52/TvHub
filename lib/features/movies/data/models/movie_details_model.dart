import 'package:movies/features/movies/index.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        genres: List<String>.from(json['genres'].map((e) => e['name'])),
        runtime: json['runtime'],
      );
}
