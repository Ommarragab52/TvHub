part of 'movies_list_bloc.dart';

class MoviesListState {
  final List<Movie> moviesList;
  final Status moviesListStatus;
  final int? errorMessageCode;
  final String? title;
  final int page;
  final int totalPage;
  MoviesListState({
    this.moviesList = const [],
    this.moviesListStatus = Status.idle,
    this.errorMessageCode = 0,
    this.page = 1,
    this.totalPage = 0,
    this.title,
  });

  MoviesListState copyWith({
    List<Movie>? moviesList,
    Status? moviesListStatus,
    int? errorMessageCode,
    String? title,
    int? page,
    int? totalPage,
  }) {
    return MoviesListState(
      moviesList: moviesList ?? this.moviesList,
      moviesListStatus: moviesListStatus ?? this.moviesListStatus,
      errorMessageCode: errorMessageCode ?? errorMessageCode,
      title: title ?? this.title,
      page: page ?? this.page,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  @override
  String toString() {
    return '''MoviesListState {
      moviesList: ${moviesList.length},
      moviesListStatus: $moviesListStatus,
      errorMessage: $errorMessageCode,
      title: $title,
      page: $page,
      totalPage: $totalPage,
    }''';
  }
}
