import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/domain/entities/tv_series.dart';

class TvSeriesState {
  // AringToday
  final Status airingTodayStatus;
  final List<TvSeries> airingTodayList;
  final int airingTodayMessageCode;
  // OnAir
  final Status onAirStatus;
  final List<TvSeries> onAirList;
  final int onAirMessageCode;
  // Popular
  final Status popularStatus;
  final List<TvSeries> popularList;
  final int popularMessageCode;
  // TopRated
  final Status topRatedStatus;
  final List<TvSeries> topRatedList;
  final int topRatedMessageCode;

  const TvSeriesState({
    this.airingTodayStatus = Status.idle,
    this.airingTodayList = const [],
    this.airingTodayMessageCode = 0,
    this.onAirStatus = Status.idle,
    this.onAirList = const [],
    this.onAirMessageCode = 0,
    this.popularStatus = Status.idle,
    this.popularList = const [],
    this.popularMessageCode = 0,
    this.topRatedStatus = Status.idle,
    this.topRatedList = const [],
    this.topRatedMessageCode = 0,
  });

  get popularMovies => null;

  TvSeriesState copyWith({
    // AiringToday
    Status? airingTodayStatus,
    List<TvSeries>? airingTodayList,
    int? airingTodayMessageCode,
    // OnAir
    Status? onAirStatus,
    List<TvSeries>? onAirList,
    int? onAirMessageCode,
    // Popular
    Status? popularStatus,
    List<TvSeries>? popularList,
    int? popularMessageCode,
    // TopRated
    Status? topRatedStatus,
    List<TvSeries>? topRatedList,
    int? topRatedMessageCode,
  }) {
    return TvSeriesState(
      airingTodayStatus: airingTodayStatus ?? this.airingTodayStatus,
      airingTodayList: airingTodayList ?? this.airingTodayList,
      airingTodayMessageCode:
          airingTodayMessageCode ?? this.airingTodayMessageCode,
      onAirStatus: onAirStatus ?? this.onAirStatus,
      onAirList: onAirList ?? this.onAirList,
      onAirMessageCode: onAirMessageCode ?? this.onAirMessageCode,
      popularStatus: popularStatus ?? this.popularStatus,
      popularList: popularList ?? this.popularList,
      popularMessageCode: popularMessageCode ?? this.popularMessageCode,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedList: topRatedList ?? this.topRatedList,
      topRatedMessageCode: topRatedMessageCode ?? this.topRatedMessageCode,
    );
  }

  @override
  String toString() {
    return '''TvSeriesState {
      airingTodayStatus: $airingTodayStatus,
      airingTodayList: ${airingTodayList.length},
      airingTodayMessage: $airingTodayMessageCode,
      onAirStatus: $onAirStatus,
      onAirList: ${onAirList.length},
      onAirMessage: $onAirMessageCode,
      popularStatus: $popularStatus,
      popularList: ${popularList.length},
      popularMessage: $popularMessageCode,
      topRatedStatus: $topRatedStatus,
      topRatedList: ${topRatedList.length},
      topRatedMessage: $topRatedMessageCode
    }''';
  }
}
