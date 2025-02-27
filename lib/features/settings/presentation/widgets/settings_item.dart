import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailing;
  final VoidCallback? onTap;
  final ShapeBorder? shape;

  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.trailing,
    this.shape,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      shape: shape ?? const RoundedRectangleBorder(),
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
