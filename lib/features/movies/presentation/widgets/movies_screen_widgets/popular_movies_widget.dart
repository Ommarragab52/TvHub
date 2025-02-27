import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          current.popularStatus != previous.popularStatus,
      builder: (context, state) {
        bool loading = state.popularStatus == Status.idle;
        return switch (state.popularStatus) {
          Status.idle || Status.success => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Skeletonizer(
                  enabled: loading,
                  child: Column(
                    children: [
                      CustomTitleAndButtonWidget(
                        title: context.loc.popular,
                        onPressed: () {
                          context.pushNamed(
                            AppRoutes.moviesListRoute,
                            arguments: GetPopularMoviesListEvent(),
                          );
                        },
                      ),
                      SizedBox(
                        height: 180,
                        child: MediaItemListView(
                          loading
                              ? dummyData
                              : state.popularMovies.reversed.toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Status.failure => NoInternetConnectionSliverWidget(
              getErrorByCode(state.popularMessageCode)),
        };
      },
    );
  }
}
