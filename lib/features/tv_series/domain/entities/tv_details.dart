import 'package:movies/features/tv_series/domain/entities/season.dart';

class TvDetails {
  final int id;
  final String? name;
  final String? overview;
  final String? backdropPath;
  final List<Season>? seasons;
  final String? firstAirDate;
  final List<String>? genres;
  final double? voteAverage;

  const TvDetails({
    required this.id,
    required this.name,
    required this.overview,
    required this.seasons,
    required this.backdropPath,
    required this.firstAirDate,
    required this.genres,
    required this.voteAverage,
  });
}
