part of 'home_bloc.dart';

class HomeState {
  final int navBarIndex;
  HomeState({
    this.navBarIndex = 0,
  });

  HomeState copyWith({
    int? navBarIndex,
  }) {
    return HomeState(
      navBarIndex: navBarIndex ?? this.navBarIndex,
    );
  }

  @override
  String toString() => 'HomeState(navBarIndex: $navBarIndex';
}
