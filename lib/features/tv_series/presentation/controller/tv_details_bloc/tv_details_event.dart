part of 'tv_details_bloc.dart';

sealed class TvDetailsEvent {}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;
  GetTvDetailsEvent(this.id);
}

class GetSeasonEpisodesEvent extends TvDetailsEvent {
  final int id;
  final int seasonNumber;
  GetSeasonEpisodesEvent(this.id, this.seasonNumber);
}

class GetMoreLikeThisEvent extends TvDetailsEvent {
  final int id;
  GetMoreLikeThisEvent(this.id);
}
