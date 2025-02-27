import 'package:flutter/widgets.dart';
import 'package:movies/l10n/app_localizations.dart';


extension Navigation on BuildContext {
  pop() {
    Navigator.of(this).pop();
  }

  push(
    Route route,
  ) {
    Navigator.of(this).push(route);
  }

  pushNamed(
    String route, {
    Object? arguments,
  }) {
    Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  pushReplacementNamed(
    String route, {
    Object? arguments,
  }) {
    Navigator.of(this).pushReplacementNamed(route, arguments: arguments);
  }

  pushAndRemoveUntilNamed(
    String route, {
    required bool Function(Route<dynamic>) predicate,
    Object? arguments,
  }) {
    Navigator.of(this)
        .pushNamedAndRemoveUntil(route, predicate, arguments: arguments);
  }
}

extension ListExtension on List? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension LocalizationExtenstion on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
