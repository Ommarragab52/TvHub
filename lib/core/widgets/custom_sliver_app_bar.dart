import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extension_functions.dart';
import 'package:movies/core/utils/app_routes.dart';
import 'package:movies/core/widgets/custom_search_text_filed.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 70,
      floating: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: CustomSearchTextFiled(
            onTap: () {
              context.pushNamed(AppRoutes.searchRoute);
            },
            readOnly: true),
      ),
    );
  }
}
