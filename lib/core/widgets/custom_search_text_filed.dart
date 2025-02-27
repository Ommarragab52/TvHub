import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/style/app_styles.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/l10n/app_localizations.dart';

class CustomSearchTextFiled extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  const CustomSearchTextFiled({
    super.key,
    this.readOnly,
    this.onTap,
    this.controller,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SvgPicture.asset(
            Assets.imagesSvgSearchIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              autofocus: false,
              readOnly: readOnly ?? false,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                hintText: AppLocalizations.of(context)!.search,
                hintStyle: AppStyles.style14Regular,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
