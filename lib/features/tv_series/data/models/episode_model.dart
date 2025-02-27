import 'package:movies/features/tv_series/index.dart';

class EpisodeModel extends Episode {
  EpisodeModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.airDate,
    required super.stillPath,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        id: json["id"],
        name: json["name"],
        overview: json['overview'],
        airDate: json["air_date"],
        stillPath: json["still_path"],
      );
}
