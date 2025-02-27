import 'package:movies/core/base/media_item.dart';

class TvSeries extends MediaItem {
  final String name;
  final String? firstAirDate;

  const TvSeries({
    required super.id,
    required this.name,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required this.firstAirDate,
    required super.voteAverage,
    required super.genreIds,
  });
}
