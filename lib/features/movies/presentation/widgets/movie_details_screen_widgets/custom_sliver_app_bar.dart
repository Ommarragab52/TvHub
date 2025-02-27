import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDetailsSliverAppBar extends StatelessWidget {
  final String? imgPath;
  final String? title;
  const CustomDetailsSliverAppBar({
    super.key,
    required this.imgPath,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.darkBackgroundColor,
      surfaceTintColor: AppColors.darkBackgroundColor,
      expandedHeight: 450,
      collapsedHeight: 60,
      pinned: true,
      leading: const Skeleton.ignore(
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: CustomBackButton(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Skeleton.replace(
          child: _buildSliderImageWithGradient(imgPath),
        ),
        title: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: AppStyles.style18Bold.copyWith(fontSize: 14),
        ),
        titlePadding: const EdgeInsets.only(left: 60, right: 60, bottom: 12),
        centerTitle: true,
      ),
    );
  }
}

Widget _buildSliderImageWithGradient(String? imageUrl) {
  return ShaderMask(
    shaderCallback: _createGradientShader,
    blendMode: BlendMode.dstIn,
    child: CachedNetworkImage(
      imageUrl: ApiConstants.getImage(imageUrl ?? ''),
      placeholder: (context, url) => const CustomImagePlaceHolder(
        width: double.infinity,
        height: double.infinity,
      ),
      errorWidget: (context, url, error) => const CustomImageErrorWidget(),
      fit: BoxFit.cover,
    ),
  );
}

Shader _createGradientShader(Rect rect) {
  return const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 0.1, 0.9, 1.0],
    colors: [
      Colors.transparent,
      AppColors.darkBackgroundColor,
      AppColors.darkBackgroundColor,
      Colors.transparent,
    ],
  ).createShader(rect);
}
