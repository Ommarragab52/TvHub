import 'package:flutter/material.dart';
import 'package:movies/core/index.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        color: Colors.transparent, // Background color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                context.loc.search_title,
                style: AppStyles.style14Regular.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
