import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlayingMoviesWidget extends StatelessWidget {
  const PlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          current.nowPlayingStatus != previous.nowPlayingStatus,
      builder: (context, state) {
        bool loading = state.nowPlayingStatus == Status.idle;
        return switch (state.nowPlayingStatus) {
          Status.idle || Status.success => SliverPadding(
              padding: const EdgeInsets.only(bottom: 16),
              sliver: SliverToBoxAdapter(
                child: Skeletonizer(
                  enabled: loading,
                  child: PlayingMoviesCarouselSlider(
                    loading ? dummyData : state.nowPlayingMovies.toList(),
                  ),
                ),
              ),
            ),
          Status.failure => const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            ),
        };
      },
    );
  }
}
