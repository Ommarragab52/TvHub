import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      buildWhen: (previous, current) =>
          previous.tvDetailsStatus != current.tvDetailsStatus,
      builder: (context, state) {
        final loading = state.tvDetailsStatus == Status.idle;
        switch (state.tvDetailsStatus) {
          case Status.idle || Status.success:
            if (!loading && state.tvDetails!.seasons!.isNullOrEmpty()) {
              return const Center(child: Text('No Seasons'));
            }
            return Skeletonizer(
              enabled: loading,
              child: CustomDropDownButton(state.tvDetails),
            );

          case Status.failure:
            return Center(
                child: Text(getErrorByCode(state.tvDetailsMessageCode)));
        }
      },
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  final TvDetails? tvDetails;
  const CustomDropDownButton(
    this.tvDetails, {
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TvDetailsBloc>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: DropdownButton(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        isExpanded: true,
        borderRadius: BorderRadius.circular(8),
        underline: Container(),
        value: value,
        items: widget.tvDetails?.seasons?.map((e) {
          return DropdownMenuItem(value: e.seasonNumber, child: Text(e.name!));
        }).toList(),
        onChanged: (value) {
          setState(() {
            this.value = value!;
          });
          bloc.add(GetSeasonEpisodesEvent(widget.tvDetails!.id, value!));
        },
      ),
    );
  }
}
