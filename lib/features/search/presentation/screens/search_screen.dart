import 'package:flutter/material.dart';
import 'package:movies/features/search/index.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CustomHeader()),
            CustomSearchSliverAppBar(),
            CustomSearchListWidget(),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            TrendingListWidget(),
          ],
        ),
      ),
    );
  }
}
