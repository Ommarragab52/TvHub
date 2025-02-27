import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrendItemWidget extends StatelessWidget {
  final SearchItem item;
  final int index;
  const TrendItemWidget(
    this.item,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        if (item.mediaType == 'movie') {
          context.pushNamed(
            AppRoutes.movieDetailsRoute,
            arguments: item.id,
          );
        } else {
          context.pushNamed(
            AppRoutes.tvSeriesDetailsRoute,
            arguments: item.id,
          );
        }
      },
      child: Stack(
        children: [
          Skeleton.replace(
            height: 180,
            width: 120,
            child: CustomImageWidget(
              ApiConstants.getImage(item.posterPath ?? ''),
            ),
          ),
          Positioned(
            top: 4,
            left: 4,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.darkBackgroundColor,
              child: Text(
                '${index + 1}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
