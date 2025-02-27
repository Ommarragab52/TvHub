import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;
  SearchRepositoryImpl(this._searchRemoteDataSource);
  @override
  Future<ApiResult> getSearchResults(String query) async {
    try {
      final searchList = await _searchRemoteDataSource.getSearchResults(query);
      return ApiSuccess<List<SearchItem>>(searchList);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getTrending() async {
    try {
      final trendingList = await _searchRemoteDataSource.getTrending();
      return ApiSuccess<List<SearchItem>>(trendingList);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }
}
