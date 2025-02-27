import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class MoviesState {
  // now playing
  final Status nowPlayingStatus;
  final List<Movie> nowPlayingMovies;
  final int nowPlayingMessageCode;
  // popular
  final Status popularStatus;
  final List<Movie> popularMovies;
  final int popularMessageCode;
  // upcoming
  final Status upcomingStatus;
  final List<Movie> upcomingMovies;
  final int upcomingMessageCode;
  // top rated
  final Status topRatedStatus;
  final List<Movie> topRatedMovies;
  final int topRatedMessageCode;

  const MoviesState({
    this.nowPlayingStatus = Status.idle,
    this.popularStatus = Status.idle,
    this.topRatedStatus = Status.idle,
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingMovies = const [],
    this.nowPlayingMessageCode = 0,
    this.popularMessageCode = 0,
    this.topRatedMessageCode = 0,
    this.upcomingStatus = Status.idle,
    this.upcomingMovies = const [],
    this.upcomingMessageCode = 0,
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    Status? nowPlayingStatus,
    int? nowPlayingMessageCode,
    List<Movie>? popularMovies,
    Status? popularStatus,
    int? popularMessageCode,
    List<Movie>? topRatedMovies,
    Status? topRatedStatus,
    int? topRatedMessageCode,
    List<Movie>? upcomingMovies,
    Status? upcomingStatus,
    int? upcomingMessageCode,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingMessageCode:
          nowPlayingMessageCode ?? this.nowPlayingMessageCode,
      popularMovies: popularMovies ?? this.popularMovies,
      popularStatus: popularStatus ?? this.popularStatus,
      popularMessageCode: popularMessageCode ?? this.popularMessageCode,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedMessageCode: topRatedMessageCode ?? this.topRatedMessageCode,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      upcomingStatus: upcomingStatus ?? this.upcomingStatus,
      upcomingMessageCode: upcomingMessageCode ?? this.upcomingMessageCode,
    );
  }

  @override
  String toString() => '''MoviesState {
      nowPlayingStatus: $nowPlayingStatus,
      nowPlayingMovies: ${nowPlayingMovies.length},
      nowPlayingMessage: $nowPlayingMessageCode,
      popularStatus: $popularStatus,
      popularMovies: ${popularMovies.length},
      popularMessage: $popularMessageCode,
      topRatedStatus: $topRatedStatus,
      topRatedMovies: ${topRatedMovies.length},
      topRatedMessage: $topRatedMessageCode,
      upcomingStatus: $upcomingStatus,
      upcomingMovies: ${upcomingMovies.length},
      upcomingMessage: $upcomingMessageCode
    }''';
}
