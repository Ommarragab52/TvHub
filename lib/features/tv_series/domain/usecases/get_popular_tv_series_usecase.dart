import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetPopularTvSeriesUsecase {
  final TvSeriesRepository _tvSeriesRepository;
  GetPopularTvSeriesUsecase(this._tvSeriesRepository);
  Future<ApiResult> call(int page) async =>
      await _tvSeriesRepository.getPopularTvSeries(page);
}
