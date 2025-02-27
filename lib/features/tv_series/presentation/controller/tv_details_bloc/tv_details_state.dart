part of 'tv_details_bloc.dart';

class TvDetailsState {
  // Tv Details
  final Status tvDetailsStatus;
  final TvDetails? tvDetails;
  final int tvDetailsMessageCode;
  // Season Episodes
  final Status episodesStatus;
  final List<Episode>? episodesList;
  final int episodesMessageCode;
  // get more like this
  final Status moreLikeThisStatus;
  final List<TvSeries>? moreLikeThisTvList;
  final int moreLikeThisMessageCode;

  const TvDetailsState({
    this.tvDetailsStatus = Status.idle,
    this.tvDetails,
    this.tvDetailsMessageCode = 0,
    this.episodesStatus = Status.idle,
    this.episodesList = const [],
    this.episodesMessageCode = 0,
    this.moreLikeThisStatus = Status.idle,
    this.moreLikeThisTvList = const [],
    this.moreLikeThisMessageCode = 0,
  });

  TvDetailsState copyWith({
    Status? tvDetailsStatus,
    TvDetails? tvDetails,
    int? tvDetailsMessageCode,
    Status? episodesStatus,
    List<Episode>? episodes,
    int? episodesMessageCode,
    Status? moreLikeThisStatus,
    List<TvSeries>? moreLikeThisTvList,
    int? moreLikeThisMessageCode,
  }) =>
      TvDetailsState(
        tvDetailsStatus: tvDetailsStatus ?? this.tvDetailsStatus,
        tvDetails: tvDetails ?? this.tvDetails,
        tvDetailsMessageCode: tvDetailsMessageCode ?? this.tvDetailsMessageCode,
        episodesStatus: episodesStatus ?? this.episodesStatus,
        episodesList: episodes ?? episodesList,
        episodesMessageCode: episodesMessageCode ?? this.episodesMessageCode,
        moreLikeThisStatus: moreLikeThisStatus ?? this.moreLikeThisStatus,
        moreLikeThisTvList: moreLikeThisTvList ?? this.moreLikeThisTvList,
        moreLikeThisMessageCode:
            moreLikeThisMessageCode ?? this.moreLikeThisMessageCode,
      );

  @override
  String toString() {
    return '''TvDetailsState {
     tvDetailsStatus: $tvDetailsStatus,
     tvDetails: $tvDetails,
     tvDetailsMessage: $tvDetailsMessageCode,
     episodesStatus: $episodesStatus,
     episodes: ${episodesList!.length},
     episodesMessage: $episodesMessageCode,
     moreLikeThisStatus: $moreLikeThisStatus,
     moreLikeThisTvList: ${moreLikeThisTvList!.length},
     moreLikeThisMessage: $moreLikeThisMessageCode
   }''';
  }
}
