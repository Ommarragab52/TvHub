import 'package:movies/features/search/domain/entity/search_item.dart';
import 'package:movies/features/movies/domain/entities/movie.dart';
import 'package:movies/features/movies/domain/entities/movie_details.dart';
import 'package:movies/features/tv_series/domain/entities/season.dart';
import 'package:movies/features/tv_series/domain/entities/tv_details.dart';
import 'package:movies/features/tv_series/domain/entities/tv_series.dart';

MovieDetails dummyMovieDetails = MovieDetails(
  id: 1,
  backdropPath: 'backdropPath',
  title: 'title',
  overview:
      'overviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverview',
  genres: ['drama', 'action', 'action'],
  voteAverage: 8.5,
  runtime: 100,
  releaseDate: '2024-10-05',
  posterPath: 'posterPath',
);

TvDetails dummyTvDetails = const TvDetails(
  id: 1,
  backdropPath: 'backdropPath',
  name: 'title',
  overview:
      'overviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverview',
  genres: ['drama', 'action', 'action'],
  voteAverage: 8.5,
  firstAirDate: '2024-10-05',
  seasons: [
    Season(id: 1, name: 'name', seasonNumber: 1),
    Season(id: 1, name: 'name', seasonNumber: 2),
  ],
);

List<Movie> dummyData = List.filled(
  5,
  const Movie(
    id: 1,
    backdropPath: 'backdropPath',
    title: 'title',
    posterPath: 'posterPath',
    overview:
        'overviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverview',
    voteAverage: 8.5,
    releaseDate: '2024-10-05',
    genreIds: [1, 2, 3],
  ),
);

List<SearchItem> dummySearchItems = List.filled(
  10,
  const SearchItem(
    title: 'Loading movies',
    mediaType: 'movie',
    id: 1,
    posterPath: '',
  ),
);

List<TvSeries> tvDummyData = List.filled(
  5,
  const TvSeries(
    id: 1,
    backdropPath: 'backdropPath',
    name: 'title',
    posterPath: 'posterPath',
    overview:
        'overviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverviewoverview',
    voteAverage: 8.5,
    firstAirDate: '2024-10-05',
    genreIds: [1, 2, 3],
  ),
);
