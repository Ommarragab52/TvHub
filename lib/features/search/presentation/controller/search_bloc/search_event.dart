part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchByQueryEvent extends SearchEvent {
  final String query;
  SearchByQueryEvent(this.query);
}

class GetTrendingEvent extends SearchEvent {}
