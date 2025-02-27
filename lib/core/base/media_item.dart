abstract class MediaItem {
  final int id;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final double? voteAverage;
  final List<int>? genreIds;

  const MediaItem({
    required this.id,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
  });
}
