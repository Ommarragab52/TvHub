import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomEpisodeItem extends StatelessWidget {
  final Episode? episode;
  const CustomEpisodeItem(
    this.episode, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 120,
        child: Row(
          spacing: 10,
          children: [
            Skeleton.replace(
              height: 140,
              width: 100,
              child: CustomImageWidget(episode!.stillPath),
            ),
            Expanded(
              child: _buildInfo(),
            )
          ],
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
          episode?.name ?? 'name',
          overflow: TextOverflow.ellipsis,
          style: AppStyles.style12Regular.copyWith(color: Colors.white),
        ),
        if (episode?.overview?.isNotEmpty ?? false)
          Text(
            episode?.overview ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppStyles.style12Regular.copyWith(
              fontSize: 10,
            ),
          ),
        Flexible(
          child: Text(
            episode?.airDate ?? 'airDate',
            overflow: TextOverflow.ellipsis,
            style: AppStyles.style12Regular.copyWith(
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
