import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/presentation/controller/movies_list_bloc/movies_list_bloc.dart';
import 'package:movies/features/movies/presentation/widgets/movies_lsit_screen_widgets/custom_movies_list_item.dart';
import 'package:movies/features/movies/presentation/widgets/movies_lsit_screen_widgets/custom_movies_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() {
    final bloc = context.read<MoviesListBloc>();
    if (bloc.state.moviesListStatus != Status.success) return;

    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        bloc.state.page != bloc.state.totalPage) {
      switch (bloc.currentEvent) {
        case GetPopularMoviesListEvent():
          bloc.add(GetPopularMoviesListEvent(page: bloc.state.page + 1));
        case GetTopRatedMoviesListEvent():
          bloc.add(GetTopRatedMoviesListEvent(page: bloc.state.page + 1));
        case null:
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListBloc, MoviesListState>(
      builder: (context, state) {
        final loading = state.moviesListStatus == Status.idle;
        return Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomBackButton(),
            ),
            title: Skeletonizer(
              enabled: loading,
              child: Text(
                state.title ?? 'Movies list screen',
                style: AppStyles.style14Regular.copyWith(color: Colors.white),
              ),
            ),
          ),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              switch (state.moviesListStatus) {
                Status.idle || Status.success => Skeletonizer.sliver(
                    enabled: loading,
                    child: MultiSliver(children: [
                      CustomMoviesListView(
                        loading ? dummyData : state.moviesList,
                      ),
                      if (state.page != state.totalPage)
                        Skeletonizer(child: CustomMoviesListItem(dummyData[0]))
                    ]),
                  ),
                Status.failure => SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        getErrorByCode(state.errorMessageCode ?? 0),
                      ),
                    ),
                  )
              }
            ],
          ),
        );
      },
    );
  }
}
