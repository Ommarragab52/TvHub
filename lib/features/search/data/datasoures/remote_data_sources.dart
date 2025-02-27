import 'package:dio/dio.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchItem>> getSearchResults(String query);
  Future<List<SearchItem>> getTrending();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio _dio;
  SearchRemoteDataSourceImpl(this._dio);
  @override
  Future<List<SearchItemModel>> getSearchResults(String query) async {
    final response = await _dio.get(
      ApiConstants.searchEP,
      queryParameters: {
        'query': query,
      },
    );
    return (response.data['results'] as List)
        .where(
          (e) => e['media_type'] == 'movie' || e['media_type'] == 'tv',
        )
        .map((e) => SearchItemModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<SearchItem>> getTrending() async {
    final response = await _dio.get(ApiConstants.trendingTodayEP);
    return (response.data['results'] as List)
        .where(
          (e) => e['media_type'] == 'movie' || e['media_type'] == 'tv',
        )
        .map((e) => SearchItemModel.fromJson(e))
        .toList();
  }
}
