import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/search/index.dart';

class CustomSearchSliverAppBar extends StatelessWidget {
  const CustomSearchSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 60,
      title: CustomSearchTextFiled(
        controller: searchBloc.searchController,
        onChanged: (query) {
          searchBloc.searchDebouncing(query);
        },
      ),
    );
  }
}
