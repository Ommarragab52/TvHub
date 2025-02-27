import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMoviesListItem extends StatelessWidget {
  const CustomMoviesListItem(
    this.movie, {
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.pushNamed(AppRoutes.movieDetailsRoute, arguments: movie.id);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 160,
          child: Row(
            children: [
              Skeleton.replace(
                height: 180,
                width: 100,
                child: CustomImageWidget(movie.posterPath!),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildInfo(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildInfo() {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: AppStyles.style14Regular.copyWith(color: Colors.white),
        ),
        BuildMovieInfo(
          releaseDate: movie.releaseDate,
          voteAverage: movie.voteAverage,
        ),
        Flexible(
          child: Text(
            movie.overview ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: AppStyles.style12Regular.copyWith(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
