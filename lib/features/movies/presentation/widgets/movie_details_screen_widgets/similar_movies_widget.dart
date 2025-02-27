import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.similarMoviesStatus != current.similarMoviesStatus,
      builder: (context, state) {
        final loading = state.similarMoviesStatus == Status.idle;
        switch (state.similarMoviesStatus) {
          case Status.idle || Status.success:
            if (state.similarMoviesStatus == Status.success &&
                state.similarMovies.isNullOrEmpty()) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(context.loc.no_similar_movies),
                ),
              );
            }
            if (state.similarMovies.isEmpty) {
              return const SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
            }
            final similarMovies = state.similarMovies.sublist(0, 12);
            return Skeletonizer.sliver(
                enabled: loading,
                child: SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: MultiSliver(children: [
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 8),
                      sliver: SliverToBoxAdapter(
                        child: CustomTitleAndButtonWidget(
                          title: context.loc.similar_movies,
                        ),
                      ),
                    ),
                    SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: similarMovies.length,
                      itemBuilder: (context, index) =>
                          MediaItemWidget(similarMovies[index]),
                    ),
                  ]),
                ));
          case Status.failure:
            return SliverToBoxAdapter(
              child: SizedBox.shrink()
            );
        }
      },
    );
  }
}
