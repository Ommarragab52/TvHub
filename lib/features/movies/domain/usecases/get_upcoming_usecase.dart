import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetUpcomingUseCase {
  final MoviesRepository _moviesRepository;

  GetUpcomingUseCase(this._moviesRepository);

  Future<ApiResult> call({required int page}) async {
    return await _moviesRepository.getUpcoming(page);
  }
}
