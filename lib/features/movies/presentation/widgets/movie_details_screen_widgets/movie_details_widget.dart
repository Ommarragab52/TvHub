import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MovieAppBarAndDetailsWidget extends StatelessWidget {
  const MovieAppBarAndDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsStatus != current.movieDetailsStatus,
      builder: (context, state) {
        final loading = state.movieDetailsStatus == Status.idle &&
            state.movieDetails == null;
        return switch (state.movieDetailsStatus) {
          Status.idle || Status.success => Skeletonizer.sliver(
              enabled: loading,
              child: MultiSliver(
                children: [
                  CustomDetailsSliverAppBar(
                    imgPath: state.movieDetails?.backdropPath,
                    title: state.movieDetails?.title,
                  ),
                  CustomMovieInfoWidget(
                      loading ? dummyMovieDetails : state.movieDetails!),
                ],
              ),
            ),
          Status.failure =>SliverFillRemaining(
            child: Stack(
              children: [
                Positioned(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomBackButton(),
                )),
                Center(
                  child: Text(getErrorByCode(state.similarMoviesMessageCode)),
                ),
              ],
            ),
          )
        };
      },
    );
  }
}
