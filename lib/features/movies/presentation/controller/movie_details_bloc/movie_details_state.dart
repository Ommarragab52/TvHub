part of 'movie_details_bloc.dart';

class MovieDetailsState {
  final Status movieDetailsStatus;
  final int movieDetailsMessageCode;
  final MovieDetails? movieDetails;
  final Status similarMoviesStatus;
  final int similarMoviesMessageCode;
  final List<Movie> similarMovies;
  // movie images
  final Status imagesStatus;
  final List<String> imagesList;
  final int imagesMessageCode;
  // movie videos
  final Status videosStatus;
  final List<String> videosList;
  final int videosMessageCode;
  const MovieDetailsState({
    this.movieDetailsStatus = Status.idle,
    this.movieDetailsMessageCode = 0,
    this.movieDetails,
    this.similarMoviesStatus = Status.idle,
    this.similarMoviesMessageCode = 0,
    this.similarMovies = const [],
    this.imagesStatus = Status.idle,
    this.imagesList = const [],
    this.imagesMessageCode = 0,
    this.videosStatus = Status.idle,
    this.videosList = const [],
    this.videosMessageCode = 0,
  });

  MovieDetailsState copyWith({
    Status? movieDetailsStatus,
    int? movieDetailsMessageCode,
    MovieDetails? movieDetails,
    Status? similarMoviesStatus,
    int? similarMoviesMessageCode,
    List<Movie>? similarMovies,
    Status? imagesStatus,
    List<String>? imagesList,
    int? imagesMessageCode,
    Status? videosStatus,
    List<String>? videosList,
    int? videosMessageCode,
  }) =>
      MovieDetailsState(
        movieDetailsStatus: movieDetailsStatus ?? this.movieDetailsStatus,
        movieDetailsMessageCode:
            movieDetailsMessageCode ?? this.movieDetailsMessageCode,
        movieDetails: movieDetails ?? this.movieDetails,
        similarMoviesStatus: similarMoviesStatus ?? this.similarMoviesStatus,
        similarMoviesMessageCode:
            similarMoviesMessageCode ?? this.similarMoviesMessageCode,
        similarMovies: similarMovies ?? this.similarMovies,
        imagesStatus: imagesStatus ?? this.imagesStatus,
        imagesList: imagesList ?? this.imagesList,
        imagesMessageCode: imagesMessageCode ?? this.imagesMessageCode,
        videosStatus: videosStatus ?? this.videosStatus,
        videosList: videosList ?? this.videosList,
        videosMessageCode: videosMessageCode ?? this.videosMessageCode,
      );

  @override
  String toString() {
    return '''MovieDetailsState {
      movieDetailsStatus: $movieDetailsStatus,
      movieDetailsMessage: $movieDetailsMessageCode,
      movieDetails: $movieDetails,
      similarMoviesStatus: $similarMoviesStatus,
      similarMoviesMessage: $similarMoviesMessageCode,
      similarMovies: ${similarMovies.length},
      imagesStatus: $imagesStatus,
      imagesList: ${imagesList.length},
      imagesMessageCode: $imagesMessageCode,
      videosStatus: $videosStatus,
      videosList: ${videosList.length},
      videosMessageCode: $videosMessageCode,
    }''';
  }
}
