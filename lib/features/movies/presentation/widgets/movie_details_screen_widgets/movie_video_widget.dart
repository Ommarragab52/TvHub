import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieVideoWidget extends StatelessWidget {
  const MovieVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        buildWhen: (previous, current) =>
            previous.videosStatus != current.videosStatus,
        builder: (context, state) {
          switch (state.videosStatus) {
            case Status.success:
              if (state.videosList.isEmpty) {
                return SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
              }
              final videoId = state.videosList[0];
              final videoUrl = 'https://www.youtube.com/embed/$videoId';
              var controller = WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {},
                    onHttpError: (HttpResponseError error) {},
                    onWebResourceError: (WebResourceError error) {},
                  ),
                )
                ..loadRequest(Uri.parse(videoUrl));
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    spacing: 8,
                    children: [
                      CustomTitleAndButtonWidget(
                        title: context.loc.trailer,
                      ),
                      SizedBox(
                        height: 220,
                        child: WebViewWidget(
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                ),
              );

            case Status.idle || Status.failure:
              return SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
          }
        });
  }
}
