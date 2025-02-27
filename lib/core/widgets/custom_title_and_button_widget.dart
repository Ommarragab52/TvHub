import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extension_functions.dart';

class CustomTitleAndButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CustomTitleAndButtonWidget({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          if (onPressed != null)
            InkWell(
              onTap: onPressed,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              child: Row(
                spacing: 4,
                children: [
                  Text(
                    context.loc.show_all,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(
                    Icons.window,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 22,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
