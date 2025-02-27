import 'package:movies/features/tv_series/index.dart';

class TvSeriesResponseModel extends TvSeriesResponse {
  TvSeriesResponseModel({
    required super.page,
    required super.totalPages,
    required super.tvSeriesList,
  });

  factory TvSeriesResponseModel.fromJson(Map<String, dynamic> json) {
    return TvSeriesResponseModel(
      page: json['page'],
      totalPages: json['total_pages'],
      tvSeriesList: (json['results'] as List)
          .map((e) => TvSeriesModel.fromJson(e))
          .toList(),
    );
  }
}
