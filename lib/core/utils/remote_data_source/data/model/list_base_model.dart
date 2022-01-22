import 'dart:convert';

import 'package:movie_series_application/core/_core_exports.dart';

class ListBaseModel<T> implements BaseModelRepo {
  ListBaseModel({required this.results, required this.totalPages, required this.page, required this.totalResults});

  final List<T> results;
  final int totalPages;
  final int page;
  final int totalResults;

  factory ListBaseModel.fromJson(String str, Function(Map<String, dynamic>)? mappingFunction) =>
      ListBaseModel.fromMap(json.decode(str), mappingFunction);

  String toJson() => json.encode(toMap());

  factory ListBaseModel.fromMap(Map<String, dynamic> json, Function(Map<String, dynamic>)? mappingFunction) {
    try {
      if (json["results"] != null) {
        ListBaseModel<T> model = ListBaseModel<T>(
          results: mappingFunction != null
              ? List<T>.from(json["results"].map((x) => mappingFunction(x)))
              : List<T>.from(json["results"].map((x) => x)),
          totalPages: json["total_pages"],
          page: json["page"],
          totalResults: json["total_results"],
        );

        return model;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Map<String, dynamic> toMap() => {
        "results": List<T>.from(results.map((x) => (x as BaseModelRepo).toMap())),
        "total_pages": totalPages,
        "page": page,
        "total_results": totalResults,
      };
}
