import 'package:flutter/material.dart';
import 'package:movies/features/tv_series/index.dart';

class EpisodesWidget extends StatelessWidget {
  const EpisodesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomDropDownMenu()),
        CustomEpisodeListView(),
      ],
    );
  }
}
