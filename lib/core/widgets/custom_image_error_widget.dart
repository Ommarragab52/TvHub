import 'package:flutter/material.dart';
import 'package:movies/core/style/app_styles.dart';

class CustomImageErrorWidget extends StatelessWidget {
  const CustomImageErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 34,
          ),
          const SizedBox(height: 8),
          Text(
            'Image not found',
            textAlign: TextAlign.center,
            style: AppStyles.style12Regular.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
