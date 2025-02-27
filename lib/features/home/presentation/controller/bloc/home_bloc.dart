import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/home/index.dart';
import 'package:movies/features/search/index.dart';
import 'package:movies/features/settings/index.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<ChangeNavBarIndexEvent>(changeNavBarIndex);
  }
  final List<Widget> pages = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => SL.searchBloc()
      // ..add(GetTrendingEvent())
      ,
      child: const SearchScreen(),
    ),
    const SettingsScreen(),
  ];
  changeNavBarIndex(ChangeNavBarIndexEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(navBarIndex: event.index));
  }
}
