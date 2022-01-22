// ignore_for_file: avoid_print

import 'dart:math';

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider(this._fetchPopulerMovieUsecase, this._fetchPopulerTvShowUsecase, this._fetchTvShowDetailUsecase) {
    fetchTvShowContent();

    fetchMovieContent().then((value) {
      getLatestContent();
    });
  }

  final FetchPopulerMovieUsecase _fetchPopulerMovieUsecase;
  final FetchPopulerTvShowUsecase _fetchPopulerTvShowUsecase;
  final FetchTvShowDetailUsecase _fetchTvShowDetailUsecase;

  //! Variables
  //* Lists

  List<MovieContent> movieContents = [];
  List<TvShowContent> tvShowContents = [];

  bool _progress = true;

  //* Texts

  final String _populerTvShow = "Populer TV Shows";
  final String _populerMovies = "Populer Movies";

  late TvShowContent tvShowContent;
  late MovieContent latestMovieContent;

  List<String> posterPaths = [
    "https://m.media-amazon.com/images/M/MV5BNDE5ZjMwNGEtYzMwMC00NzEwLTg3MWUtMmJmYTUyNDBjOGFiXkEyXkFqcGdeQXVyMTE3ODM0NzI1._V1_FMjpg_UX1000_.jpg",
    "https://tr.web.img4.acsta.net/pictures/17/11/09/13/41/0101371.jpg",
    "https://i.idefix.com/cache/600x600-0/originals/0001917208001-1.jpg",
    "https://m.media-amazon.com/images/I/514XoLkSrzL._AC_SY780_.jpg",
    "https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg",
    "https://tr.web.img4.acsta.net/pictures/19/09/11/16/43/1511539.jpg",
    "https://www.ubuy.com.tr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFIR295TTlhdFMuX1NMMTUwMF8uanBn.jpg",
  ];

  //! Methods

  /// Vote Averange'ına göre renk döndürür
  Color colorFromPoints(double point) {
    if (point < 4) {
      return AppColors.red;
    } else if (point < 6) {
      return AppColors.yellow;
    } else if (point < 8) {
      return AppColors.orange;
    } else {
      return AppColors.green;
    }
  }

  /// Son eklenen filmin ana ekranda gösterilmesini sağlayan method.
  void getLatestContent() {
    latestMovieContent = movieContents[0];
    for (var i = 0; i < movieContents.length - 1; i++) {
      if (latestMovieContent.releaseDate.isBefore(movieContents[i + 1].releaseDate)) {
        latestMovieContent = movieContents[i + 1];
        latestMovieContent.posterPath = posterPaths[2];
      }
    }
    progress = false;
    notifyListeners();
  }

  //! Future Methods

  /// Popüler Film verilerini çeker.
  Future<void> fetchMovieContent() async {
    final fetchMovieContentEither = await _fetchPopulerMovieUsecase(PageArgument(page: 1));
    return fetchMovieContentEither.fold((failure) {}, (data) {
      movieContents.addAll(data);
      for (var i = 0; i < movieContents.length; i++) {
        movieContents[i].posterPath = posterPaths[Random().nextInt(7)];
      }
      notifyListeners();
    });
  }

  /// Popüler Tv Show verilerini çeker.
  Future<void> fetchTvShowContent() async {
    final fetchTvShowContentEither = await _fetchPopulerTvShowUsecase(PageArgument(page: 1));
    return fetchTvShowContentEither.fold((failure) {}, (data) {
      tvShowContents.addAll(data);
      for (var i = 0; i < tvShowContents.length; i++) {
        tvShowContents[i].posterPath = posterPaths[Random().nextInt(7)];
      }
      notifyListeners();
    });
  }

  /// Popüler Tv Showlarından seçili olanın detayındaki veriyi çeker.
  Future<void> fetchTvShowDetail({required int index}) async {
    MainEndpoints.FETCH_POPULER_TV_SHOW_DETAIL.getId(index: tvShowContents[index].id);
    final fetchTvShowDetailEither = await _fetchTvShowDetailUsecase(const NoParams());
    return fetchTvShowDetailEither.fold((failure) {}, (data) {
      tvShowContent = data;
      tvShowContent.posterPath = tvShowContents.firstWhere((element) => element.id == tvShowContent.id).posterPath;
      progress = false;
      notifyListeners();
    });
  }

  //! Get Set Methods

  String get populerTvShow => _populerTvShow;

  String get populerMovies => _populerMovies;

  bool get progress => _progress;
  set progress(bool value) {
    _progress = value;
    notifyListeners();
  }
}
