import 'package:flutter/material.dart';
import 'package:movies/core/base/media_item.dart';
import 'package:movies/core/widgets/media_item_widget.dart';

class MediaItemListView extends StatelessWidget {
  final List<MediaItem> mediaItemList;
  const MediaItemListView(
    this.mediaItemList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mediaItemList.length,
      itemExtent: 120,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 8),
        child: MediaItemWidget(mediaItemList[index]),
      ),
    );
  }
}
