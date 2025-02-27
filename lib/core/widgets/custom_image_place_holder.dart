import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImagePlaceHolder extends StatelessWidget {
  final double width;
  final double height;
  const CustomImagePlaceHolder(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        color: Colors.black,
        height: height,
        width: width,
      ),
    );
  }
}
