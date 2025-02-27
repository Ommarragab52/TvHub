import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchResultUsecase _getSearchResultUsecase;
  final GetTrendingUsecase _getTrendingUsecase;

  TextEditingController searchController = TextEditingController();
  SearchBloc(
    this._getSearchResultUsecase,
    this._getTrendingUsecase,
  ) : super(SearchIdle()) {
    on<SearchByQueryEvent>(_getSearchResults);
    on<GetTrendingEvent>(_getTrending);
  }

  _getSearchResults(
    SearchByQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    final result = await _getSearchResultUsecase(event.query);
    switch (result) {
      case ApiSuccess():
        emit(SearchResultLoaded(result.data));
        break;
      case ApiError():
        emit(SearchResultError(result.faliure.code));
        break;
    }
  }

  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  searchDebouncing(String query) {
    _debouncer.run(() {
      add(SearchByQueryEvent(query));
    });
  }

  FutureOr<void> _getTrending(
      GetTrendingEvent event, Emitter<SearchState> emit) async {
    emit(TrendingLoading());
    final result = await _getTrendingUsecase();
    switch (result) {
      case ApiSuccess():
        emit(TrendingLoaded(result.data));
        break;
      case ApiError():
        emit(TrendingError(result.faliure.code));
        break;
    }
  }
}
