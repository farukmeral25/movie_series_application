import 'package:dartz/dartz.dart';

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class FetchPopulerMovieUsecase implements Usecase<List<MovieContent>, PageArgument> {
  HomeRepository homeRepository;
  FetchPopulerMovieUsecase({
    required this.homeRepository,
  });
  @override
  Future<Either<Failure, List<MovieContent>>> call(PageArgument params) async {
    return await homeRepository.fetchPopulerMovie(params);
  }
}
