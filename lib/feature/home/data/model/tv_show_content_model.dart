import 'dart:convert';

import 'package:movie_series_application/feature/_feature_exports.dart';

class TvShowContentModel extends TvShowContent {
  TvShowContentModel({
    required int id,
    required String posterPath,
    int? episodes,
    int? seasons,
    String? originalTitle,
    String? overview,
    DateTime? firstAirDate,
    double? voteAverage,
  }) : super(
            id: id,
            posterPath: posterPath,
            episodes: episodes,
            firstAirDate: firstAirDate,
            overview: overview,
            seasons: seasons,
            voteAverage: voteAverage,
            originalTitle: originalTitle);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'poster_path': posterPath,
      'overview': overview,
      'episodes': episodes,
      'seasons': seasons,
      'voteAverage': voteAverage,
      'firstAirDate': firstAirDate,
    };
  }

  factory TvShowContentModel.fromMap(Map<String, dynamic> map) {
    return TvShowContentModel(
      id: map['id']?.toInt() ?? 0,
      posterPath: map['poster_path'] ?? '',
      overview: map['overview'],
      originalTitle: map['original_name'],
      episodes: map['number_of_episodes']?.toInt(),
      seasons: map['number_of_seasons']?.toInt(),
      voteAverage: map['vote_average']?.toDouble(),
      firstAirDate: map['first_air_date'] != null ? DateTime.parse(map['first_air_date']) : null,
    );
  }

  static TvShowContentModel staticFromMap(Map<String, dynamic> map) {
    return TvShowContentModel(
      id: map['id']?.toInt() ?? 0,
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TvShowContentModel.fromJson(String source) => TvShowContentModel.fromMap(json.decode(source));
}
