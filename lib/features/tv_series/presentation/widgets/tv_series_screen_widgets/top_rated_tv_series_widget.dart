import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_bloc.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopRatedTvSeriesWidget extends StatelessWidget {
  const TopRatedTvSeriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesBloc, TvSeriesState>(
      buildWhen: (previous, current) =>
          previous.topRatedStatus != current.topRatedStatus,
      builder: (context, state) {
        final loading = state.topRatedStatus == Status.idle;
        switch (state.topRatedStatus) {
          case Status.idle || Status.success:
            if (state.topRatedStatus == Status.success &&
                state.topRatedList.isNullOrEmpty()) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('No Top Rated Tv Series'),
                ),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Skeletonizer(
                  enabled: loading,
                  child: Column(
                    children: [
                      CustomTitleAndButtonWidget(
                        title: context.loc.top_rated,
                        onPressed: () {
                          // context.pushNamed(
                          //   AppRoutes.moviesListRoute,
                          //   arguments: GetPopularMoviesListEvent(),
                          // );
                        },
                      ),
                      SizedBox(
                        height: 180,
                        child: MediaItemListView(
                          loading ? dummyData : state.topRatedList,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          case Status.failure:
            return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
