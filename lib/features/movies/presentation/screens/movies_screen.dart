import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/widgets/movies_screen_widgets/playing_movies_widget.dart';
import 'package:movies/features/movies/presentation/widgets/movies_screen_widgets/popular_movies_widget.dart';
import 'package:movies/features/movies/presentation/widgets/movies_screen_widgets/top_rated_movies_widget.dart';
import 'package:movies/features/movies/presentation/widgets/movies_screen_widgets/upcoming_movies_widget.dart';
import 'package:movies/features/settings/presentation/controller/bloc/settings_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: RefreshIndicator(
        backgroundColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.onPrimary,
        onRefresh: () async {
          context.read<SettingsBloc>().refreshAppData();
        },
        child: const CustomScrollView(
          slivers: [
            PlayingMoviesWidget(),
            PopularMoviesWidget(),
            UpcomingMoviesWidget(),
            TopRatedMoviesWidget(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
