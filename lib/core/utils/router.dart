import 'package:flutter/cupertino.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/core/init/injection_container.dart';
import 'package:movie_series_application/feature/home/_home_exports.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOMEPAGEROUTE:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    case TVSHOWMOVIEDETAILPAGEROUTE:
      serviceLocator<HomeProvider>().progress = true;
      final SeriesMovieArgument argument = settings.arguments as SeriesMovieArgument;
      return CupertinoPageRoute(
        builder: (_) => TvShowMovieDetailPage(
          contentIndex: argument.contentIndex,
          type: argument.type,
        ),
      );

    default:
      return MaterialPageRoute(builder: (_) => const HomePage());
  }
}
