import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          current.topRatedStatus != previous.topRatedStatus,
      builder: (context, state) {
        bool loading = state.topRatedStatus == Status.idle;
        return switch (state.topRatedStatus) {
          Status.idle || Status.success => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Skeletonizer(
                  enabled: loading,
                  child: Column(
                    children: [
                      CustomTitleAndButtonWidget(
                        title: context.loc.top_rated,
                        onPressed: () {
                          context.pushNamed(
                            AppRoutes.moviesListRoute,
                            arguments: GetTopRatedMoviesListEvent(),
                          );
                        },
                      ),
                      SizedBox(
                        height: 180,
                        child: MediaItemListView(
                          loading ? dummyData : state.topRatedMovies,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Status.failure => const SliverToBoxAdapter(child: SizedBox.shrink()),
        };
      },
    );
  }
}
