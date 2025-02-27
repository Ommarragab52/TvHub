import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/settings/index.dart';

class ChangeRegionScreen extends StatelessWidget {
  const ChangeRegionScreen({super.key});

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
          context.loc.change_region,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: RegionList(),
      ),
    );
  }
}

class RegionList extends StatefulWidget {
  const RegionList({super.key});

  @override
  State<RegionList> createState() => _RegionListState();
}

class _RegionListState extends State<RegionList> {
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    final regionCode = context.read<SettingsBloc>().state.regionCode;
    log(regionCode);
    selectedIndex = AppConstants.appRegionsCodes.indexOf(regionCode);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: AppConstants.appRegionsCodes.map(
        (regionCode) {
          final index = AppConstants.appRegionsCodes.indexOf(regionCode);
          return RegionItem(
            isSelected: selectedIndex == index,
            regionCode: regionCode,
            onTap: () {
              if (selectedIndex == index) return;
              setState(() {
                selectedIndex = index;
              });
              context.read<SettingsBloc>().add(ChangeRegionEvent(regionCode));
            },
          );
        },
      ).toList(),
    );
  }
}

class RegionItem extends StatelessWidget {
  final bool isSelected;
  final String regionCode;
  final VoidCallback? onTap;
  const RegionItem({
    super.key,
    required this.isSelected,
    required this.regionCode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        tileColor: isSelected ? Colors.blueAccent : null,
        onTap: onTap,
        title: Text(getCountryNameByCode(regionCode)),
        trailing: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}
