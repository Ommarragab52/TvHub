import 'package:movies/features/tv_series/index.dart';

class TvSeriesModel extends TvSeries {
  TvSeriesModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.firstAirDate,
    required super.voteAverage,
    required super.genreIds,
  });
  factory TvSeriesModel.fromJson(Map<String, dynamic> json) {
    return TvSeriesModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: List<int>.from(json['genre_ids']),
    );
  }
}
