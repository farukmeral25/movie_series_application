import 'dart:convert';

import 'package:movie_series_application/feature/_feature_exports.dart';

class MovieContentModel extends MovieContent {
  MovieContentModel({
    required String originalTitle,
    required String overview,
    required double voteAverage,
    required DateTime releaseDate,
    required String posterPath,
  }) : super(
          originalTitle: originalTitle,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
        );

  Map<String, dynamic> toMap() {
    return {
      'original_title': originalTitle,
      'overview': overview,
      'vote_average': voteAverage,
      'release_date': releaseDate.millisecondsSinceEpoch,
      'poster_path': posterPath,
    };
  }

  factory MovieContentModel.fromMap(Map<String, dynamic> map) {
    return MovieContentModel(
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      releaseDate: DateTime.parse(map['release_date']),
      posterPath: map['poster_path'] ?? '',
    );
  }

  static MovieContentModel staticFromMap(Map<String, dynamic> map) {
    return MovieContentModel(
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      releaseDate: DateTime.parse(map['release_date']),
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieContentModel.fromJson(String source) => MovieContentModel.fromMap(json.decode(source));
}
