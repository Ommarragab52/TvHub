import 'package:flutter/material.dart';
import 'package:movies/core/extensions/extension_functions.dart';
import 'package:movies/core/services/service_locator.dart';

class GenreHelper {
  static Map<int, String> getMovieGenres(BuildContext context) {
    return {
      28: context.loc.action,
      12: context.loc.adventure,
      16: context.loc.animation,
      35: context.loc.comedy,
      80: context.loc.crime,
      99: context.loc.documentary,
      18: context.loc.drama,
      10751: context.loc.family,
      14: context.loc.fantasy,
      36: context.loc.history,
      27: context.loc.horror,
      10402: context.loc.music,
      9648: context.loc.mystery,
      10749: context.loc.romance,
      878: context.loc.science_fiction,
      10770: context.loc.tv_movie,
      53: context.loc.thriller,
      10752: context.loc.war,
      37: context.loc.western,
    };
  }

  static Map<int, String> getTvGenres(BuildContext context) {
    return {
      10759: context.loc.action_and_adventure,
      16: context.loc.animation,
      35: context.loc.comedy,
      80: context.loc.crime,
      99: context.loc.documentary,
      18: context.loc.drama,
      10751: context.loc.family,
      10762: context.loc.kids,
      9648: context.loc.mystery,
      10763: context.loc.news,
      10764: context.loc.reality,
      10765: context.loc.sci_fi_and_fantasy,
      10766: context.loc.soap,
      10767: context.loc.talk,
      10768: context.loc.war_and_politics,
      37: context.loc.western,
    };
  }

  static List<String> getMovieGenreNames(
      BuildContext context, List<int> genreIds) {
    final genreMap = getMovieGenres(context);
    final genres = <String>[];

    for (var key in genreIds) {
      if (genreMap.containsKey(key)) {
        genres.add(genreMap[key]!);
      }
    }

    return genres.length > 2 ? genres.sublist(0, 2) : genres;
  }

  static List<String> getTvGenreNames(
      BuildContext context, List<int> genreIds) {
    final genreMap = getTvGenres(context);
    final genres = <String>[];

    for (var key in genreIds) {
      if (genreMap.containsKey(key)) {
        genres.add(genreMap[key]!);
      }
    }

    return genres.length > 2 ? genres.sublist(0, 2) : genres;
  }
}

List<String> getMovieGenres(List<int> genreIds) {
  return GenreHelper.getMovieGenreNames(SL.context, genreIds);
}

List<String> getTvGenres(List<int> genreIds) {
  return GenreHelper.getTvGenreNames(SL.context, genreIds);
}
