import 'package:dartz/dartz.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieContent>>> fetchPopulerMovie();
  Future<Either<Failure, List<TvShowContent>>> fetchPopulerTvShow();
  Future<Either<Failure, TvShowContent>> fetchTvShowDetail();
}
