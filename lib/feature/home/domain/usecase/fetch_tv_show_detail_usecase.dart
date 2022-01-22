import 'package:dartz/dartz.dart';

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class FetchTvShowDetailUsecase implements Usecase<TvShowContent, NoParams> {
  HomeRepository homeRepository;
  FetchTvShowDetailUsecase({
    required this.homeRepository,
  });
  @override
  Future<Either<Failure, TvShowContent>> call(NoParams params) async {
    return await homeRepository.fetchTvShowDetail();
  }
}
