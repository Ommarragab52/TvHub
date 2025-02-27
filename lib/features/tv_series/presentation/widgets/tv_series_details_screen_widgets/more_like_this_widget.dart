import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoreLikeThisWidget extends StatefulWidget {
  const MoreLikeThisWidget({super.key});

  @override
  State<MoreLikeThisWidget> createState() => _MoreLikeThisWidgetState();
}

class _MoreLikeThisWidgetState extends State<MoreLikeThisWidget> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<TvDetailsBloc>();
    bloc.add(GetMoreLikeThisEvent(bloc.state.tvDetails!.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
        buildWhen: (previous, current) =>
            previous.moreLikeThisStatus != current.moreLikeThisStatus,
        builder: (context, state) {
          final loading = state.moreLikeThisStatus == Status.idle;
          switch (state.moreLikeThisStatus) {
            case Status.idle || Status.success:
              if (state.moreLikeThisStatus == Status.success &&
                  state.moreLikeThisTvList!.isNullOrEmpty()) {
                return Center(
                  child: Text(context.loc.no_similar_tv_shows),
                );
              } else {
                if (state.moreLikeThisTvList!.isNullOrEmpty()) {
                  return const SizedBox.shrink();
                }
                final list = state.moreLikeThisTvList!.sublist(0, 12);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Skeletonizer(
                    enabled: loading,
                    child: GridView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) =>
                          MediaItemWidget(list[index]),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.6,
                      ),
                    ),
                  ),
                );
              }
            default:
              return Center(
                  child: Text(
                getErrorByCode(state.moreLikeThisMessageCode),
              ));
          }
        });
  }
}
