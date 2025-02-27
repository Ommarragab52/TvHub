import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

import 'package:skeletonizer/skeletonizer.dart';

class CustomEpisodeListView extends StatelessWidget {
  const CustomEpisodeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      buildWhen: (previous, current) =>
          previous.episodesStatus != current.episodesStatus,
      builder: (context, state) {
        final loading = state.episodesStatus == Status.idle;
        switch (state.episodesStatus) {
          case Status.idle || Status.success:
            if (state.episodesStatus == Status.success &&
                state.episodesList.isNullOrEmpty()) {
              return const SliverFillRemaining(
                  child: Center(child: Text('No episodes found')));
            }
            return Skeletonizer.sliver(
              enabled: loading,
              child: SliverList.builder(
                itemCount: state.episodesList?.length,
                itemBuilder: (context, index) => CustomEpisodeItem(
                  state.episodesList?[index],
                ),
              ),
            );

          case Status.failure:
            return SliverFillRemaining(
                child: Center(
                    child: Text(getErrorByCode(state.episodesMessageCode))));
        }
      },
    );
  }
}
