import 'package:flutter/material.dart';
import 'package:movies/features/movies/index.dart';


class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const MovieAppBarAndDetailsWidget(),

            const MovieVideoWidget(),

            const SimilarMoviesWidget(),
          ],
        ),
      ),
    );
  }
}
