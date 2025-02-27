sealed class TvSeriesEvent {}

class GetAiringTodayTvSeriesEvent extends TvSeriesEvent {}

class GetOnTheAirTvSeriesEvent extends TvSeriesEvent {}

class GetPopularTvSeriesEvent extends TvSeriesEvent {}

class GetTopRatedTvSeriesEvent extends TvSeriesEvent {}

class RefreshTvDataEvent extends TvSeriesEvent {}
