import 'package:movies/features/movies/index.dart';

class VideosResponseModel extends VideosResponse {
  VideosResponseModel(super.videosIds);
  factory VideosResponseModel.fromJson(Map<String, dynamic> json) {
    final List<String> videosIds = [];
    for (final video in json['results']) {
      if (video['site'] == 'YouTube' && video['type'] == 'Trailer') {
        videosIds.add(video['key'].toString());
      }
    }
    return VideosResponseModel(videosIds);
  }
}
