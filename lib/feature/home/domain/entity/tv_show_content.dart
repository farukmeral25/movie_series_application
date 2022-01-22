class TvShowContent {
  final int id;
  String posterPath;
  final String? originalTitle;
  final String? overview;
  final int? episodes;
  final int? seasons;
  final double? voteAverage;
  final DateTime? firstAirDate;

  TvShowContent({
    required this.id,
    required this.posterPath,
    this.originalTitle,
    this.overview,
    this.episodes,
    this.seasons,
    this.voteAverage,
    this.firstAirDate,
  });
}
