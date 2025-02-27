import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpcomingMovieItem extends StatelessWidget {
  final Movie movie;
  const UpcomingMovieItem(
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
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Skeleton.replace(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: ApiConstants.getImage(movie.backdropPath ?? ''),
              errorWidget: (context, url, error) =>
                  const CustomImageErrorWidget(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CustomImagePlaceHolder(
                width: double.infinity,
                height: double.infinity,
              ),
              fit: BoxFit.cover,
            ),
          ),
          _buildMoiveInfoWidget(movie.title),
        ],
      ),
    );
  }
}

_buildMoiveInfoWidget(String title) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: AppStyles.style16Regular.copyWith(
            overflow: TextOverflow.ellipsis,
            shadows: [
              const Shadow(
                color: Colors.black,
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
