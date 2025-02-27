import 'package:movies/core/base/media_item.dart';

class Movie extends MediaItem {
  final String title;
  final String? releaseDate;

  const Movie({
    required super.id,
    required this.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required this.releaseDate,
    required super.genreIds,
  });
}
