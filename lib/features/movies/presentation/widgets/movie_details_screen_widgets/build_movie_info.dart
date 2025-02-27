import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';

class BuildMovieInfo extends StatelessWidget {
  final String? releaseDate;
  final double? voteAverage;
  final int? runtime;

  const BuildMovieInfo({
    super.key,
    this.releaseDate,
    this.voteAverage,
    this.runtime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            releaseDate!.isNotEmpty ? releaseDate!.substring(0, 4) : 'Null',
            style: AppStyles.style12Regular.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              '${(voteAverage! * 10).round() / 10}',
              style: AppStyles.style12Regular.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        if (runtime != null)
          Text('${runtime.toString()} ${context.loc.min}',
              style: AppStyles.style12Regular),
      ],
    );
  }
}
