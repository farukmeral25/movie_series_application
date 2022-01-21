import 'package:movie_series_application/feature/_feature_exports.dart';

class Content {
  final String contentName;
  final ContentEnum contentType;
  final String contentImage;
  final String contentDescription;
  final double contentPoints;
  final DateTime contentDate;
  final bool isMovie;
  final int? contentEpisodes;
  final int? contentSeason;

  Content({
    required this.contentName,
    required this.contentType,
    required this.contentImage,
    required this.contentDescription,
    required this.contentPoints,
    required this.contentDate,
    required this.isMovie,
    this.contentSeason,
    this.contentEpisodes,
  });
}
