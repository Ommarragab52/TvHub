import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/tv_series/index.dart';

class TvSeriesScreen extends StatelessWidget {
  const TvSeriesScreen({super.key});

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
            AiringTodayTvSeriesWidget(),
            OnTheAirTvSeriesWidget(),
            PopularTvSeriesWidget(),
            TopRatedTvSeriesWidget(),
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
