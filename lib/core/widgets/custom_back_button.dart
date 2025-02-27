import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extension_functions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        context.pop();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
