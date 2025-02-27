import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetAiringTodayTvSeriesUsecase _getAiringTodayTvSeriesUsecase;
  final GetOnTheAirTvSeriesUsecase _getOnTheAirTvSeriesUsecase;
  final GetPopularTvSeriesUsecase _getPopularTvSeriesUsecase;
  final GetTopRatedTvSeriesUsecase _getTopRatedTvSeriesUsecase;

  TvSeriesBloc(
    this._getAiringTodayTvSeriesUsecase,
    this._getOnTheAirTvSeriesUsecase,
    this._getPopularTvSeriesUsecase,
    this._getTopRatedTvSeriesUsecase,
  ) : super(const TvSeriesState()) {
    on<GetAiringTodayTvSeriesEvent>(_getAiringTodayTvSeries);
    on<GetOnTheAirTvSeriesEvent>(_getOnTheAirTvSeries);
    on<GetPopularTvSeriesEvent>(_getPopularTvSeries);
    on<GetTopRatedTvSeriesEvent>(_getTopRatedTvSeries);
    on<RefreshTvDataEvent>(_refreshData);
  }
  void _getAiringTodayTvSeries(
    GetAiringTodayTvSeriesEvent event,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(state.copyWith(airingTodayStatus: Status.idle));
    final result = await _getAiringTodayTvSeriesUsecase(1);
    switch (result) {
      case ApiSuccess():
        emit(state.copyWith(
          airingTodayStatus: Status.success,
          airingTodayList: (result.data as TvSeriesResponse).tvSeriesList,
        ));

      case ApiError():
        emit(state.copyWith(
          airingTodayStatus: Status.failure,
          airingTodayMessageCode: result.faliure.code,
        ));
    }
  }

  void _getOnTheAirTvSeries(
    GetOnTheAirTvSeriesEvent event,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(state.copyWith(onAirStatus: Status.idle));
    final result = await _getOnTheAirTvSeriesUsecase(1);
    switch (result) {
      case ApiSuccess():
        emit(state.copyWith(
          onAirStatus: Status.success,
          onAirList: (result.data as TvSeriesResponse).tvSeriesList,
        ));

      case ApiError():
        emit(state.copyWith(
          onAirStatus: Status.failure,
          onAirMessageCode: result.faliure.code,
        ));
    }
  }

  void _getPopularTvSeries(
    GetPopularTvSeriesEvent event,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(state.copyWith(popularStatus: Status.idle));
    final result = await _getPopularTvSeriesUsecase(1);
    switch (result) {
      case ApiSuccess():
        emit(state.copyWith(
          popularStatus: Status.success,
          popularList: (result.data as TvSeriesResponse).tvSeriesList,
        ));

      case ApiError():
        emit(state.copyWith(
          popularStatus: Status.failure,
          popularMessageCode: result.faliure.code,
        ));
    }
  }

  void _getTopRatedTvSeries(
    GetTopRatedTvSeriesEvent event,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(state.copyWith(topRatedStatus: Status.idle));
    final result = await _getTopRatedTvSeriesUsecase(1);
    switch (result) {
      case ApiSuccess():
        emit(state.copyWith(
          topRatedStatus: Status.success,
          topRatedList: (result.data as TvSeriesResponse).tvSeriesList,
        ));

      case ApiError():
        emit(state.copyWith(
          topRatedStatus: Status.failure,
          topRatedMessageCode: result.faliure.code,
        ));
    }
  }

  void _refreshData(
    RefreshTvDataEvent event,
    Emitter<TvSeriesState> emit,
  ) {
    add(GetAiringTodayTvSeriesEvent());
    add(GetOnTheAirTvSeriesEvent());
    add(GetPopularTvSeriesEvent());
    add(GetTopRatedTvSeriesEvent());
  }
}
