import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/movies/index.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<Movie> movies;
  final CarouselOptions carouselOptions;
  final Widget Function(Movie movie) buildItem;
  const CustomCarouselSlider(
    this.movies, {
    super.key,
    required this.carouselOptions,
    required this.buildItem,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: carouselOptions,
      itemCount: movies.length ~/ 2,
      itemBuilder: (context, index, realIndex) => buildItem(movies[index]),
    );
  }
}
