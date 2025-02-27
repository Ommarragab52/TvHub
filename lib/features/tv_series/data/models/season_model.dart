import 'package:movies/features/tv_series/index.dart';

class SeasonModel extends Season {
  SeasonModel({
    required super.id,
    required super.name,
    required super.seasonNumber,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        id: json['id'],
        name: json['name'],
        seasonNumber: json['season_number'],
      );
}
