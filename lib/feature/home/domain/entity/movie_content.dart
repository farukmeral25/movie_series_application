import 'package:movie_series_application/feature/_feature_exports.dart';

class MovieContent {
  final String originalTitle;
  final String overview;
  final double voteAverage;
  final DateTime releaseDate;
  String posterPath;
  final ContentEnum? type;

  MovieContent({
    required this.originalTitle,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
    this.type = ContentEnum.MOVIE,
  });
}
