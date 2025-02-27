import 'package:movies/core/index.dart';

abstract class SearchRepository {
  Future<ApiResult> getSearchResults(String query);
  Future<ApiResult> getTrending();
}
