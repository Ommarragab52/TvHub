import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class CustomMovieInfoWidget extends StatelessWidget {
  final MovieDetails movieDetails;

  const CustomMovieInfoWidget(
    this.movieDetails, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            BuildMovieInfo(
              releaseDate: movieDetails.releaseDate,
              voteAverage: movieDetails.voteAverage,
              runtime: movieDetails.runtime,
            ),
            const SizedBox(height: 16),
            Text(
              movieDetails.overview!,
              style: AppStyles.style12Regular,
            ),
            const SizedBox(height: 8),
            _buildMovieGenres(movieDetails.genres, context),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

_buildMovieGenres(List<String>? genres, BuildContext context) {
  return Text(
    '${context.loc.generes} : ${genres!.map((e) => e).join(', ').toString()}',
    style: AppStyles.style12Regular.copyWith(
      color: Colors.white,
    ),
  );
}
