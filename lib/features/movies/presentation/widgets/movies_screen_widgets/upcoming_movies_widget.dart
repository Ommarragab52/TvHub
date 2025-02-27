import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  const UpcomingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          current.upcomingStatus != previous.upcomingStatus,
      builder: (context, state) {
        switch (state.upcomingStatus) {
          case Status.idle:
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Skeletonizer(
                  enabled: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTitleAndButtonWidget(
                          title: context.loc.upcoming,
                        ),
                      ),
                      CustomCarouselSlider(
                        dummyData,
                        carouselOptions: CarouselOptions(
                          height: 200,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          initialPage: 0,
                          scrollDirection: Axis.vertical,
                          enlargeCenterPage: true,
                          autoPlay: false,
                        ),
                        buildItem: (Movie movie) => UpcomingMovieItem(movie),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case Status.idle || Status.success:
            {
              if (state.upcomingMovies.isEmpty) {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTitleAndButtonWidget(
                          title: context.loc.upcoming,
                        ),
                      ),
                      CustomCarouselSlider(
                        state.upcomingMovies,
                        carouselOptions: CarouselOptions(
                          height: 200,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          initialPage: 0,
                          scrollDirection: Axis.vertical,
                          enlargeCenterPage: true,
                          autoPlay: false,
                        ),
                        buildItem: (Movie movie) => UpcomingMovieItem(movie),
                      ),
                    ],
                  ),
                ),
              );
            }
          case Status.failure:
            return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
