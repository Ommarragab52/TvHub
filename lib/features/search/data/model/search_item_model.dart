import 'package:movies/features/search/index.dart';

class SearchItemModel extends SearchItem {
  SearchItemModel({
    required super.id,
    required super.title,
    required super.mediaType,
    required super.posterPath,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) {
    if (json['media_type'] == 'movie') {
      return SearchItemModel(
        id: json['id'],
        title: json['title'],
        mediaType: json['media_type'],
        posterPath: json['poster_path'],
      );
    } else {
      return SearchItemModel(
        id: json['id'],
        title: json['name'],
        mediaType: json['media_type'],
        posterPath: json['poster_path'],
      );
    }
  }
}
