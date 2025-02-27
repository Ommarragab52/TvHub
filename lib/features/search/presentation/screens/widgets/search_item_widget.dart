import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

class SearchItemWidget extends StatelessWidget {
  final SearchItem searchItem;
  const SearchItemWidget(this.searchItem, {super.key, t});

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
      onTap: () {
        switch (searchItem.mediaType) {
          case 'movie':
            context.pushNamed(
              AppRoutes.movieDetailsRoute,
              arguments: searchItem.id,
            );

          case 'tv':
            context.pushNamed(
              AppRoutes.tvSeriesDetailsRoute,
              arguments: searchItem.id,
            );
        }
      },
      leading: Icon(searchItem.mediaType == 'movie'
          ? Icons.local_movies
          : Icons.live_tv_rounded),
      title: Text(
        searchItem.title,
        style: AppStyles.style14Regular.copyWith(color: Colors.white),
      ),
    );
  }
}
