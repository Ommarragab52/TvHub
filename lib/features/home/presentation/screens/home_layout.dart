import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/index.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.navBarIndex,
            children: context.read<HomeBloc>().pages,
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
