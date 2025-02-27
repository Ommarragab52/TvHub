import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetPopularUseCase {
  final MoviesRepository repository;
  GetPopularUseCase(this.repository);

  Future<ApiResult> call({required int page}) async =>
      await repository.getPopular(page);
}
