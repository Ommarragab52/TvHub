import 'package:movies/features/movies/index.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
      genreIds: List<int>.from(json['genre_ids']),
    );
  }
}
