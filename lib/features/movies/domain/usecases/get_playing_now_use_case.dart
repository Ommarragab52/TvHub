import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetPlayingNowUseCase {
  final MoviesRepository repository;
  GetPlayingNowUseCase(this.repository);

  Future<ApiResult> call({required int page}) async =>
      await repository.getNowPlaying(page);
}
