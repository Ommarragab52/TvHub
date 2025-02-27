import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/presentation/widgets/movies_screen_widgets/playing_movie_item.dart';
import 'package:movies/features/tv_series/domain/entities/tv_series.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AiringTodayTvItem extends StatelessWidget {
  final TvSeries tvSeries;
  const AiringTodayTvItem(
    this.tvSeries, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        context.pushNamed(
          AppRoutes.tvSeriesDetailsRoute,
          arguments: tvSeries.id,
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Skeleton.replace(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: ApiConstants.getImage(tvSeries.posterPath ?? ''),
              placeholder: (context, url) => const CustomImagePlaceHolder(
                width: double.infinity,
                height: double.infinity,
              ),
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
            title: tvSeries.name,
            releaseDate: tvSeries.firstAirDate,
            genreIds: tvSeries.genreIds,
            type: 'tv',
          ),
        ],
      ),
    );
  }
}
