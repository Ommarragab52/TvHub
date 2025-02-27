import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetSimilarTvSeriesUsecase {
  final TvSeriesRepository _tvSeriesRepository;

  GetSimilarTvSeriesUsecase(this._tvSeriesRepository);

  Future<ApiResult> call(int id) async =>
      await _tvSeriesRepository.getSimilarTvSeries(id);
}
