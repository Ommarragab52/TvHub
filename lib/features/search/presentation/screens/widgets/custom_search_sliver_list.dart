import 'package:flutter/material.dart';
import 'package:movies/features/search/index.dart';

class CustomSearchSliverList extends StatelessWidget {
  final List<SearchItem> searchList;
  const CustomSearchSliverList(
    this.searchList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: searchList.length,
      itemBuilder: (context, index) => SearchItemWidget(searchList[index]),
    );
  }
}
