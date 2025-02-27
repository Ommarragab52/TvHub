import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

class GetTrendingUsecase {
  final SearchRepository _searchRepository;

  GetTrendingUsecase(this._searchRepository);

  Future<ApiResult> call() => _searchRepository.getTrending();
}
