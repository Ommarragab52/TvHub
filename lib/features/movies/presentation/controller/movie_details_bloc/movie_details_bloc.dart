import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUsecase;
  final GetSimilarMoviesUseCase _getSimilarMoviesUsecase;
  final GetMovieImagesUseCase _getMovieImagesUsecase;
  final GetMovieVideosUseCase _getMovieVideosUsecase;
  MovieDetailsBloc(
    this._getMovieDetailsUsecase,
    this._getSimilarMoviesUsecase,
    this._getMovieImagesUsecase,
    this._getMovieVideosUsecase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetSimilarMoviesEvent>(getSimilarMovies);
    on<GetMovieImagesEvent>(getMovieImages);
    on<GetMovieVideosEvent>(getMovieVideos);
  }

  void getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(movieDetailsStatus: Status.idle));
    final result = await _getMovieDetailsUsecase(event.movieId);
    switch (result) {
      case ApiSuccess():
        emit(
          state.copyWith(
            movieDetailsStatus: Status.success,
            movieDetails: result.data,
          ),
        );
        add(GetMovieVideosEvent(event.movieId));
      case ApiError():
        emit(
          state.copyWith(
            movieDetailsStatus: Status.failure,
            movieDetailsMessageCode: result.faliure.code,
          ),
        );
    }
  }

  void getSimilarMovies(
    GetSimilarMoviesEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(similarMoviesStatus: Status.idle));
    final result = await _getSimilarMoviesUsecase(event.movieId);
    switch (result) {
      case ApiSuccess():
        emit(
          state.copyWith(
            similarMoviesStatus: Status.success,
            similarMovies: (result.data as MovieResponse).movies,
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            similarMoviesStatus: Status.failure,
            similarMoviesMessageCode: (result.faliure as ServerFailure).code,
          ),
        );
    }
  }

  void getMovieImages(
    GetMovieImagesEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(imagesStatus: Status.idle));
    final result = await _getMovieImagesUsecase(movieId: event.movieId);
    switch (result) {
      case ApiSuccess():
        final images = (result.data as ImagesResponse).backdrops;
        emit(
          state.copyWith(
            imagesStatus: Status.success,
            imagesList: images.reversed.toList(),
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            imagesStatus: Status.failure,
            imagesMessageCode: (result.faliure as ServerFailure).code,
          ),
        );
    }
  }

  void getMovieVideos(
    GetMovieVideosEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(state.copyWith(videosStatus: Status.idle));
    final result = await _getMovieVideosUsecase(event.movieId);
    switch (result) {
      case ApiSuccess():
        final videosList = (result.data as VideosResponse).videosIds;
        emit(
          state.copyWith(
            videosStatus: Status.success,
            videosList: videosList,
          ),
        );
      case ApiError():
        emit(
          state.copyWith(
            videosStatus: Status.failure,
            videosMessageCode: (result.faliure as ServerFailure).code,
          ),
        );
    }
  }
}
