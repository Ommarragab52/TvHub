import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';

class CustomSliverPresistentHeaderWithTabBar extends StatelessWidget {
  const CustomSliverPresistentHeaderWithTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeaderDelegate(
          TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 12.0),
              borderSide: BorderSide(width: 2.0, color: Colors.blue),
            ),
            tabs: [
              Tab(
                text: context.loc.episodes,
              ),
              Tab(text: context.loc.similar_tv_shows),
            ],
          ),
        ));
  }
}

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  const SliverHeaderDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: AppColors.darkBackgroundColor, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
