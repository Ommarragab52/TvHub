import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetTvSeriesDetailsUsecase {
  final TvSeriesRepository _tvSeriesRepository;
  GetTvSeriesDetailsUsecase(this._tvSeriesRepository);
  Future<ApiResult> call(int id) async =>
      await _tvSeriesRepository.getTvDetails(id);
}
