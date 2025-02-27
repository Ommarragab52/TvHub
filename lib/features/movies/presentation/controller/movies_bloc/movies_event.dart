sealed class MoviesEvent {}

class GetPlayingNowMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetUpcomingMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}

class RefreshMoviesDataEvent extends MoviesEvent {}
