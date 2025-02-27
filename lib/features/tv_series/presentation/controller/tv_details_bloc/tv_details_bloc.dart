import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvSeriesDetailsUsecase _getTvSeriesDetailsUsecase;
  final GetTvSeasonEpisodesUsecase _getTvSeasonEpisodesUsecase;
  final GetSimilarTvSeriesUsecase _getSimilarTvSeriesUsecase;
  TvDetailsBloc(
    this._getTvSeriesDetailsUsecase,
    this._getTvSeasonEpisodesUsecase,
    this._getSimilarTvSeriesUsecase,
  ) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetSeasonEpisodesEvent>(_getSeasonEpisodes);
    on<GetMoreLikeThisEvent>(_getMoreLikeThis);
  }
  void _getTvDetails(
    GetTvDetailsEvent event,
    Emitter<TvDetailsState> emit,
  ) async {
    emit(state.copyWith(tvDetailsStatus: Status.idle));
    final result = await _getTvSeriesDetailsUsecase(event.id);
    switch (result) {
      case ApiSuccess():
        emit(
          state.copyWith(
            tvDetailsStatus: Status.success,
            tvDetails: (result.data as TvDetails),
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            tvDetailsStatus: Status.failure,
            tvDetailsMessageCode: result.faliure.code,
          ),
        );
    }
  }

  void _getSeasonEpisodes(
    GetSeasonEpisodesEvent event,
    Emitter<TvDetailsState> emit,
  ) async {
    emit(state.copyWith(episodesStatus: Status.idle));
    final result =
        await _getTvSeasonEpisodesUsecase(event.id, event.seasonNumber);
    switch (result) {
      case ApiSuccess():
        emit(
          state.copyWith(
            episodesStatus: Status.success,
            episodes: (result.data as List<Episode>),
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            episodesStatus: Status.failure,
            episodesMessageCode: result.faliure.code,
          ),
        );
    }
  }

  void _getMoreLikeThis(
    GetMoreLikeThisEvent event,
    Emitter<TvDetailsState> emit,
  ) async {
    emit(state.copyWith(moreLikeThisStatus: Status.idle));
    final result = await _getSimilarTvSeriesUsecase(event.id);
    switch (result) {
      case ApiSuccess():
        emit(
          state.copyWith(
            moreLikeThisStatus: Status.success,
            moreLikeThisTvList: result.data as List<TvSeries>,
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            moreLikeThisStatus: Status.failure,
            moreLikeThisMessageCode: result.faliure.code,
          ),
        );
    }
  }
}
