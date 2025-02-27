part of 'search_bloc.dart';

sealed class SearchState {}

class SearchIdle extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResultLoaded extends SearchState {
  final List<SearchItem> searchResult;

  SearchResultLoaded(this.searchResult);
}

class SearchResultError extends SearchState {
  final int messageCode;

  SearchResultError(this.messageCode);
}

class TrendingLoading extends SearchState {}

class TrendingLoaded extends SearchState {
  final List<SearchItem> trendingList;

  TrendingLoaded(this.trendingList);
}

class TrendingError extends SearchState {
  final int messageCode;

  TrendingError(this.messageCode);
}
