import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class TrendingListWidget extends StatelessWidget {
  const TrendingListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) =>
          current is TrendingLoaded ||
          current is TrendingError ||
          current is TrendingLoading,
      builder: (context, state) {
        switch (state) {
          case TrendingLoading():
            return Skeletonizer.sliver(
                child: SliverList.builder(
              itemCount: dummySearchItems.length,
              itemBuilder: (context, index) =>
                  SearchItemWidget(dummySearchItems[index]),
            ));
          case TrendingLoaded():
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: MultiSliver(
                children: [
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Text(
                          context.loc.trending_today,
                          style: AppStyles.style16Regular,
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.trending_up, color: Colors.white),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 8),
                  ),
                  SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 180,
                    ),
                    itemCount: state.trendingList.sublist(0, 10).length,
                    itemBuilder: (context, index) => TrendItemWidget(
                      state.trendingList[index],
                      index,
                    ),
                  )
                ],
              ),
            );
          case TrendingError():
            return NoInternetConnectionSliverWidget(
                getErrorByCode(state.messageCode));
          default:
            return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
