import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/widgets/custom_image_error_widget.dart';
import 'package:movies/core/widgets/custom_image_place_holder.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget(
    this.imgPath, {
    super.key,
  });

  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: ApiConstants.getImage(imgPath ?? ''),
        placeholder: (context, url) => const CustomImagePlaceHolder(
          height: 180,
          width: 120,
        ),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const CustomImageErrorWidget(),
        width: 100,
        height: 140,
      ),
    );
  }
}
