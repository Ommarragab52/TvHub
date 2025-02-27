import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:movies/features/tv_series/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class TvAppBarAndDetailsWidget extends StatelessWidget {
  const TvAppBarAndDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      buildWhen: (previous, current) =>
          previous.tvDetailsStatus != current.tvDetailsStatus,
      builder: (context, state) {
        final loading =
            state.tvDetailsStatus == Status.idle && state.tvDetails == null;
        return switch (state.tvDetailsStatus) {
          Status.idle || Status.success => Skeletonizer.sliver(
              enabled: loading,
              child: MultiSliver(
                children: [
                  CustomDetailsSliverAppBar(
                    imgPath: state.tvDetails?.backdropPath,
                    title: state.tvDetails?.name,
                  ),
                  TvInfoWidget(
                    loading ? dummyTvDetails : state.tvDetails!,
                  )
                ],
              ),
            ),
          Status.failure => SliverFillRemaining(
              child: Center(
                child: Text(getErrorByCode(state.tvDetailsMessageCode)),
              ),
            )
        };
      },
    );
  }
}

class TvInfoWidget extends StatelessWidget {
  final TvDetails tvDetails;

  const TvInfoWidget(
    this.tvDetails, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            _infoWidget(context),
            const SizedBox(height: 16),
            Text(
              tvDetails.overview!,
              style: AppStyles.style12Regular,
            ),
            const SizedBox(height: 8),
            _buildMovieGenres(context),
          ],
        ),
      ),
    );
  }

  _buildMovieGenres(BuildContext context) {
    return Text(
      '${context.loc.generes} : ${tvDetails.genres!.map((e) => e).join(', ').toString()}',
      style: AppStyles.style12Regular.copyWith(
        color: Colors.white,
      ),
    );
  }

  Row _infoWidget(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            tvDetails.firstAirDate!.isNotEmpty
                ? tvDetails.firstAirDate!.substring(0, 4)
                : '0000',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              '${(tvDetails.voteAverage! * 10).round() / 10}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        if (tvDetails.seasons != null)
          Text(
            '${tvDetails.seasons!.length.toString()} ${context.loc.seasons} ',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
      ],
    );
  }
}
