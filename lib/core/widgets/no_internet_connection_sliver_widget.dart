import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/style/app_styles.dart';
import 'package:movies/core/utils/app_assets.dart';

class NoInternetConnectionSliverWidget extends StatelessWidget {
  final String message;
  const NoInternetConnectionSliverWidget(
    this.message, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesSvgNoInternet,
              height: 100,
            ),
            Text(
              message,
              style: AppStyles.style14Regular.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
