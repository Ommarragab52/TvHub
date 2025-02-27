import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_bloc.dart';
import 'package:movies/features/tv_series/presentation/controller/tv_series_bloc/tv_series_state.dart';
import 'package:movies/features/tv_series/presentation/widgets/tv_series_screen_widgets/custom_tv_series_carousel_slider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AiringTodayTvSeriesWidget extends StatelessWidget {
  const AiringTodayTvSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesBloc, TvSeriesState>(
      buildWhen: (previous, current) =>
          previous.airingTodayStatus != current.airingTodayStatus,
      builder: (context, state) {
        final loading = state.airingTodayStatus == Status.idle;
        switch (state.airingTodayStatus) {
          case Status.idle || Status.success:
            if (state.airingTodayStatus == Status.success &&
                state.airingTodayList.isNullOrEmpty()) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('No Airing Today Tv Series'),
                ),
              );
            }
            return SliverToBoxAdapter(
              child: Skeletonizer(
                enabled: loading,
                child: CustomTvSeriesCarouselSlider(
                  loading ? tvDummyData : state.airingTodayList.toList(),
                ),
              ),
            );

          case Status.failure:
            return const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            );
        }
      },
    );
  }
}
