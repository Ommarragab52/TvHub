import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

class GetSearchResultUsecase {
  final SearchRepository _searchRepository;

  GetSearchResultUsecase(this._searchRepository);

  Future<ApiResult> call(String query) =>
      _searchRepository.getSearchResults(query);
}
