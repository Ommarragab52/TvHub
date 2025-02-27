import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetTopRatedTvSeriesUsecase {
  final TvSeriesRepository _tvSeriesRepository;
  GetTopRatedTvSeriesUsecase(this._tvSeriesRepository);
  Future<ApiResult> call(int page) async =>
      await _tvSeriesRepository.getTopRatedTvSeries(page);
}
