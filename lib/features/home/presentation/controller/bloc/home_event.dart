part of 'home_bloc.dart';

sealed class HomeEvent {}

class ChangeNavBarIndexEvent extends HomeEvent {
  final int index;
  ChangeNavBarIndexEvent(this.index);
}

class ChangeThemeEvent extends HomeEvent {}
