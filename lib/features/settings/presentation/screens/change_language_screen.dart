import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/settings/index.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          context.loc.change_language,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: LanguagesList(),
      ),
    );
  }
}

class LanguagesList extends StatefulWidget {
  const LanguagesList({super.key});

  @override
  State<LanguagesList> createState() => _LanguagesListState();
}

class _LanguagesListState extends State<LanguagesList> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    final languageCode = context.read<SettingsBloc>().state.languageCode;
    log('LanguageCode: $languageCode');
    selectedIndex = AppConstants.appLanguagesCodes.indexOf(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: AppConstants.appLanguagesCodes.map(
        (languageCode) {
          final index = AppConstants.appLanguagesCodes.indexOf(languageCode);
          return LanguageItem(
            isSelected: selectedIndex == index,
            languageCode: languageCode,
            onTap: () {
              if (selectedIndex == index) return;
              setState(() {
                selectedIndex = index;
              });
              context
                  .read<SettingsBloc>()
                  .add(ChangeLanguageEvent(languageCode));
            },
          );
        },
      ).toList(),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final bool isSelected;
  final String languageCode;
  final VoidCallback? onTap;
  const LanguageItem({
    super.key,
    required this.isSelected,
    required this.languageCode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 4),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ListTile(
        tileColor: isSelected ? Colors.blueAccent : null,
        onTap: onTap,
        title: Text(getLanguageNameByCode(languageCode)),
        trailing: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
