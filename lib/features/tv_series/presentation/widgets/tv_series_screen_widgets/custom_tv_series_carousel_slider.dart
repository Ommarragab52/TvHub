import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/tv_series/domain/entities/tv_series.dart';
import 'package:movies/features/tv_series/presentation/widgets/tv_series_screen_widgets/airing_today_tv_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomTvSeriesCarouselSlider extends StatefulWidget {
  final List<TvSeries> tvSeriesList;

  const CustomTvSeriesCarouselSlider(
    this.tvSeriesList, {
    super.key,
  });

  @override
  State<CustomTvSeriesCarouselSlider> createState() =>
      _CustomTvSeriesCarouselSliderState();
}

class _CustomTvSeriesCarouselSliderState
    extends State<CustomTvSeriesCarouselSlider> {
  CarouselSliderController controller = CarouselSliderController();
  int selectedIndex = 0;
  List<TvSeries> tvList = [];
  @override
  void initState() {
    super.initState();
    if (widget.tvSeriesList.length > 12) {
      tvList = widget.tvSeriesList.sublist(0, 12);
    } else {
      tvList = widget.tvSeriesList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: tvList.length,
          itemBuilder: (context, index, realIndex) =>
              AiringTodayTvItem(tvList[index]),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
            height: 550,
            autoPlayCurve: Curves.fastOutSlowIn,
            initialPage: tvList.length,
            enlargeCenterPage: true,
            viewportFraction: 1,
            autoPlay: true,
          ),
        ),
        Skeleton.ignore(
          child: Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 12, start: 16, end: 16),
            child: AnimatedSmoothIndicator(
              count: tvList.length,
              onDotClicked: (index) => controller.jumpToPage(index),
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
