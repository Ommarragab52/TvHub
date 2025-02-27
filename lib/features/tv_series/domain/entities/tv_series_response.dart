import 'package:movies/features/tv_series/domain/entities/tv_series.dart';

class TvSeriesResponse {
  final int page;
  final int totalPages;
  final List<TvSeries> tvSeriesList;

  TvSeriesResponse({
    required this.page,
    required this.totalPages,
    required this.tvSeriesList,
  });
}
