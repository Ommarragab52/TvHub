import 'package:flutter/material.dart';
import 'package:movies/features/tv_series/index.dart';

class TvSeriesDetailsScreen extends StatelessWidget {
  const TvSeriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const TvAppBarAndDetailsWidget(),
              const CustomSliverPresistentHeaderWithTabBar(),
            ],
            body: const TabBarView(
              children: [
                EpisodesWidget(),
                MoreLikeThisWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
