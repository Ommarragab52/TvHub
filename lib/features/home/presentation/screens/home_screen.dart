import 'package:flutter/material.dart';
import 'package:movies/features/home/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:movies/features/tv_series/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            TabBarView(
              children: [
                MoviesScreen(),
                TvSeriesScreen(),
              ],
            ),
            Positioned(top: 20, right: 0, left: 0, child: HomeTabBar()),
          ],
        ),
      ),
    );
  }
}
