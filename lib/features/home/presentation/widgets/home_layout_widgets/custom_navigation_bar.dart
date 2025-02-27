import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/home/index.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:40,sigmaY: 100),
            child: SizedBox(
              height: kBottomNavigationBarHeight + 20,
              child: NavigationBar(
                onDestinationSelected: (index) =>
                    homeBloc.add(ChangeNavBarIndexEvent(index)),
                selectedIndex: homeBloc.state.navBarIndex,
                backgroundColor: Colors.transparent,
                height: kBottomNavigationBarHeight,
                indicatorColor: Colors.transparent,
                destinations: [
                  NavigationDestination(
                    icon: const Icon(
                      Icons.tv_outlined,
                      size: 30,
                      color: Colors.grey,
                    ),
                    selectedIcon: const Icon(
                      Icons.live_tv_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    label: SL.context.loc.home,
                  ),
                  NavigationDestination(
                    icon: SvgPicture.asset(
                      Assets.imagesSvgSearchIcon,
                      width: 26,
                      height: 26,
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    selectedIcon: SvgPicture.asset(
                      Assets.imagesSvgSearchIcon,
                      width: 30,
                      height: 30,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: SL.context.loc.search,
                  ),
                  NavigationDestination(
                    icon: const Icon(
                      Icons.display_settings_rounded,
                      color: Colors.grey,
                      size: 26,
                    ),
                    selectedIcon: const Icon(
                      Icons.display_settings_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: SL.context.loc.settings,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
