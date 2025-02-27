import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_bloc.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularTvSeriesWidget extends StatelessWidget {
  const PopularTvSeriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesBloc, TvSeriesState>(
      buildWhen: (previous, current) =>
          previous.popularStatus != current.popularStatus,
      builder: (context, state) {
        final loading = state.popularStatus == Status.idle;
        switch (state.popularStatus) {
          case Status.idle || Status.success:
            if (state.popularStatus == Status.success &&
                state.popularList.isNullOrEmpty()) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('No Popular Tv Series'),
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
                        title: context.loc.popular,
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
                          loading
                              ? dummyData
                              : state.popularList.reversed.toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          case Status.failure:
            return NoInternetConnectionSliverWidget(
                getErrorByCode(state.popularMessageCode));
        }
      },
    );
  }
}
