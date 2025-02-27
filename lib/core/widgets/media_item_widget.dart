import 'package:flutter/material.dart';
import 'package:movies/core/base/media_item.dart';
import 'package:movies/core/extensions/extension_functions.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/core/widgets/custom_image_widget.dart';
import 'package:movies/features/movies/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MediaItemWidget extends StatelessWidget {
  const MediaItemWidget(
    this.mediaItem, {
    super.key,
  });

  final MediaItem mediaItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        if (mediaItem is MovieModel) {
          context.pushNamed(
            AppRoutes.movieDetailsRoute,
            arguments: mediaItem.id,
          );
        } else {
          context.pushNamed(
            AppRoutes.tvSeriesDetailsRoute,
            arguments: mediaItem.id,
          );
        }
      },
      child: Skeleton.replace(
        height: 180,
        width: 120,
        child: CustomImageWidget(
          ApiConstants.getImage(mediaItem.posterPath ?? ''),
        ),
      ),
    );
  }
}
