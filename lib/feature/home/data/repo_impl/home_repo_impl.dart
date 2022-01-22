import 'package:dartz/dartz.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class HomeRepoImplements implements HomeRepository {
  MainBaseGet mainBaseGet;
  HomeRepoImplements({
    required this.mainBaseGet,
  });
  @override
  Future<Either<Failure, List<MovieContent>>> fetchPopulerMovie(PageArgument argument) async {
    final fetchPopulerMovieEither = await mainBaseGet(
      GetRequestParams(
        endPoint: MainEndpoints.FETCH_POPULER_MOVIE,
      ),
    );
    return fetchPopulerMovieEither.fold((failure) => Left(failure), (jsonData) {
      ListBaseModel<MovieContent> movieContentListBaseModel =
          ListBaseModel<MovieContent>.fromJson(jsonData, MovieContentModel.staticFromMap);
      List<MovieContent> movieContentList = movieContentListBaseModel.results;
      return Right(movieContentList);
    });
  }

  @override
  Future<Either<Failure, List<TvShowContent>>> fetchPopulerTvShow(PageArgument argument) async {
    final fetchPopulerTvShowEither = await mainBaseGet(
      GetRequestParams(
        endPoint: MainEndpoints.FETCH_POPULER_TV_SHOW,
      ),
    );
    return fetchPopulerTvShowEither.fold((failure) => Left(failure), (jsonData) {
      ListBaseModel<TvShowContent> tvShowContentListBaseModel =
          ListBaseModel<TvShowContent>.fromJson(jsonData, TvShowContentModel.staticFromMap);
      List<TvShowContent> tvShowContentList = tvShowContentListBaseModel.results;
      return Right(tvShowContentList);
    });
  }

  @override
  Future<Either<Failure, TvShowContent>> fetchTvShowDetail() async {
    final fetchPopulerTvShowEither = await mainBaseGet(
      GetRequestParams(
        endPoint: MainEndpoints.FETCH_POPULER_TV_SHOW_DETAIL,
      ),
    );
    return fetchPopulerTvShowEither.fold((failure) => Left(failure), (jsonData) {
      TvShowContent tvShowContent = TvShowContentModel.fromJson(jsonData);
      return Right(tvShowContent);
    });
  }
}
