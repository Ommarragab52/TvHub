import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_bloc.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OnTheAirTvSeriesWidget extends StatelessWidget {
  const OnTheAirTvSeriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesBloc, TvSeriesState>(
      buildWhen: (previous, current) =>
          previous.onAirStatus != current.onAirStatus,
      builder: (context, state) {
        final loading = state.onAirStatus == Status.idle;
        switch (state.onAirStatus) {
          case Status.idle || Status.success:
            if (state.onAirStatus == Status.success &&
                state.onAirList.isNullOrEmpty()) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('No On The Air Tv Series'),
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
                        title: context.loc.on_the_air,
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
                          loading ? dummyData : state.onAirList,
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
