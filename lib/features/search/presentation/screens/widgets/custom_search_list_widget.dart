import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:movies/features/search/index.dart';

class CustomSearchListWidget extends StatelessWidget {
  const CustomSearchListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) =>
          current is SearchResultLoaded ||
          current is SearchResultError ||
          current is SearchLoading,
      builder: (context, state) {
        switch (state) {
          case SearchLoading():
            return Skeletonizer.sliver(
                child: SliverList.builder(
              itemCount: dummySearchItems.length,
              itemBuilder: (context, index) =>
                  SearchItemWidget(dummySearchItems[index]),
            ));
          case SearchResultLoaded():
            if (state.searchResult.isEmpty &&
                searchBloc.searchController.text.isNotEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    context.loc.no_data_found,
                    style: AppStyles.style16Regular,
                  ),
                )),
              );
            }

            return SliverList.builder(
              itemCount: state.searchResult.length,
              itemBuilder: (context, index) =>
                  SearchItemWidget(state.searchResult[index]),
            );

          default:
            return const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            );
        }
      },
    );
  }
}
