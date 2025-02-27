import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlayingMovieItem extends StatelessWidget {
  final Movie movie;
  const PlayingMovieItem(
    this.movie, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        context.pushNamed(AppRoutes.movieDetailsRoute, arguments: movie.id);
      },
      child
          : Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Skeleton.replace(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: ApiConstants.getImage(movie.posterPath ?? ''),
              placeholder: (context, url) => const CustomImagePlaceHolder(
                width: double.infinity,
                height: double.infinity,
              ),
              errorWidget: (context, url, error) =>
                  const CustomImageErrorWidget(),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          PlayingMovieInfoWidget(
            title: movie.title,
            releaseDate: movie.releaseDate,
            genreIds: movie.genreIds,
            type: 'movie',
          ),
        ],
      ),
    );
  }
}

class PlayingMovieInfoWidget extends StatelessWidget {
  final String? title;
  final String? releaseDate;
  final List<int>? genreIds;
  final String type;
  const PlayingMovieInfoWidget({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.genreIds,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // decoration: const BoxDecoration(color: Colors.black54),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Skeleton.ignore(
                child: Icon(
                  Icons.play_circle_outline_rounded,
                ),
              ),
              Flexible(
                child: Text(
                  title ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (releaseDate!.length > 4)
                Text(releaseDate!.substring(0, 4),
                    style: Theme.of(context).textTheme.titleSmall),
              if (type == 'movie')
                Text(
                  getMovieGenres(genreIds!).join(' | '),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              if (type == 'tv')
                Flexible(
                  child: Text(
                    getTvGenres(genreIds!).join(' | '),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
