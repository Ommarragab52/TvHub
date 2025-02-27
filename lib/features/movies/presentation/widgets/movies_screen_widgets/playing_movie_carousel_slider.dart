import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/movies/index.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlayingMoviesCarouselSlider extends StatefulWidget {
  final List<Movie> movies;

  const PlayingMoviesCarouselSlider(
    this.movies, {
    super.key,
  });

  @override
  State<PlayingMoviesCarouselSlider> createState() =>
      _PlayingMoviesCarouselSliderState();
}

class _PlayingMoviesCarouselSliderState
    extends State<PlayingMoviesCarouselSlider> {
  final controller = CarouselSliderController();
  int selectedIndex = 0;
  List<Movie> moviesList = [];
  @override
  void initState() {
    super.initState();
    if (widget.movies.length > 12) {
      moviesList = widget.movies.sublist(0, 12);
    } else {
      moviesList = widget.movies;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: 550,
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: selectedIndex,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          itemCount: moviesList.length,
          itemBuilder: (context, index, realIndex) =>
              PlayingMovieItem(moviesList[index]),
        ),
        Skeleton.ignore(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: AnimatedSmoothIndicator(
              count: moviesList.length,
              onDotClicked: (index) {
                controller.jumpToPage(index);
              },
              activeIndex: selectedIndex,
              effect: const SlideEffect(
                spacing: 3,
                radius: 2,
                dotWidth: 24.0,
                dotHeight: 5,
                dotColor: Colors.blueGrey,
                activeDotColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
