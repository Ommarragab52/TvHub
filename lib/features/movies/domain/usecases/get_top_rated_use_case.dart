import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetTopRatedUseCase {
  final MoviesRepository repository;
  GetTopRatedUseCase(this.repository);

  Future<ApiResult> call({required int page}) async =>
      await repository.getTopRated(page);
}
