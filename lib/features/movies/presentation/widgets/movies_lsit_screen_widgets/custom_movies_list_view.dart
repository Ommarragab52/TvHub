import 'package:flutter/material.dart';
import 'package:movies/features/movies/index.dart';

class CustomMoviesListView extends StatelessWidget {
  final List<Movie> movies;
  const CustomMoviesListView(
    this.movies, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return CustomMoviesListItem(movies[index]);
      },
    );
  }
}
