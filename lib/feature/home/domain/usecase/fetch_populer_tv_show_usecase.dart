import 'package:dartz/dartz.dart';

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class FetchPopulerTvShowUsecase implements Usecase<List<TvShowContent>, PageArgument> {
  HomeRepository homeRepository;
  FetchPopulerTvShowUsecase({
    required this.homeRepository,
  });
  @override
  Future<Either<Failure, List<TvShowContent>>> call(PageArgument params) async {
    return await homeRepository.fetchPopulerTvShow(params);
  }
}
