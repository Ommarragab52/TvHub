import 'package:movies/features/tv_series/index.dart';

class TvDetailsModel extends TvDetails {
  TvDetailsModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.seasons,
    required super.backdropPath,
    required super.firstAirDate,
    required super.genres,
    required super.voteAverage,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        seasons: List<SeasonModel>.from(
          json['seasons'].map((s) => SeasonModel.fromJson(s)),
        ),
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        genres: List<String>.from(
          json['genres'].map((g) => g['name']),
        ),
        voteAverage: json['vote_average'].toDouble(),
      );
}
