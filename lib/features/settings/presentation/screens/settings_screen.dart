import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/settings/index.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.settings,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            final settings = context.read<SettingsBloc>();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Center(
                    child: SvgPicture.asset(Assets.appIconSvg,
                        height: 100,
                        width: 100,
                    ),
                  ),
                  Text(context.loc.apperance,
                      style: Theme.of(context).textTheme.titleSmall!),
                  SettingsItem(
                    title: context.loc.dark_mode,
                    icon: Icons.dark_mode_outlined,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    trailing: Switch(
                      value: settings.state.currentTheme?.brightness ==
                          Brightness.dark,
                      onChanged: (value) {
                        settings.add(ToggleThemeEvent());
                      },
                    ),
                    onTap: () => settings.add(ToggleThemeEvent()),
                  ),
                  Text(context.loc.languages_and_regions,
                      style: Theme.of(context).textTheme.titleSmall!),
                  SettingsItem(
                    title: context.loc.change_language,
                    icon: Icons.language,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () => context.pushNamed(
                      AppRoutes.changeLanguageScreenRoute,
                    ),
                  ),
                  SettingsItem(
                    title: context.loc.change_region,
                    icon: Icons.location_city,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () => context.pushNamed(
                      AppRoutes.changeRegionScreenRoute,
                    ),
                  ),
                  Text(context.loc.general,
                      style: Theme.of(context).textTheme.titleSmall!),
                  SettingsItem(
                    title: context.loc.terms_and_conditions,
                    icon: Icons.description,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  SettingsItem(
                    title: context.loc.help_and_support,
                    icon: Icons.help,
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  SettingsItem(
                    title: context.loc.privacy_policy,
                    icon: Icons.privacy_tip,
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  SettingsItem(
                    title: context.loc.about,
                    icon: Icons.info_outline,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
