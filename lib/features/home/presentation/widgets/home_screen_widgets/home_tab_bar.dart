import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const ShapeDecoration(
        color: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
      child: TabBar(
        tabs: [
          Tab(text: context.loc.movies),
          Tab(text: context.loc.tv_shows),
        ],
      ),
    );
  }
}
