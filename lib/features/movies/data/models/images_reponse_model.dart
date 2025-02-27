import 'package:movies/features/movies/index.dart';

class ImagesReponseModel extends ImagesResponse {
  ImagesReponseModel({required super.backdrops});

  factory ImagesReponseModel.fromJson(Map<String, dynamic> json) {
    return ImagesReponseModel(
      backdrops: List<String>.from(
        (json['backdrops'] as List).map((e) => e['file_path']),
      ),
    );
  }
}
