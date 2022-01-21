// ignore_for_file: avoid_print

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    fetchMovieAndTvShow();
    getLatestContent();
  }

  //! Variables
  //* Lists
  List<Content> contents = [
    Content(
      contentName: "Attack on Titan",
      contentType: ContentEnum.TVSHOW,
      contentImage:
          "https://m.media-amazon.com/images/M/MV5BNDE5ZjMwNGEtYzMwMC00NzEwLTg3MWUtMmJmYTUyNDBjOGFiXkEyXkFqcGdeQXVyMTE3ODM0NzI1._V1_FMjpg_UX1000_.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 9.8,
      contentDate: DateTime(2018, 08, 04),
      contentSeason: 4,
      contentEpisodes: 26,
      isMovie: false,
    ),
    Content(
      contentName: "Dark",
      contentType: ContentEnum.MOVIE,
      contentImage: "https://tr.web.img4.acsta.net/pictures/17/11/09/13/41/0101371.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 4.8,
      contentDate: DateTime(2016, 08, 04),
      isMovie: true,
    ),
    Content(
      contentName: "Peaky Blinders",
      contentType: ContentEnum.TVSHOW,
      contentImage: "https://i.idefix.com/cache/600x600-0/originals/0001917208001-1.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 10.0,
      contentDate: DateTime(2022, 01, 20),
      contentSeason: 3,
      contentEpisodes: 12,
      isMovie: false,
    ),
    Content(
      contentName: "the Office",
      contentType: ContentEnum.MOVIE,
      contentImage: "https://m.media-amazon.com/images/I/514XoLkSrzL._AC_SY780_.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 8.6,
      contentDate: DateTime(2012, 08, 04),
      isMovie: true,
    ),
    Content(
      contentName: "Game Of Thrones",
      contentType: ContentEnum.TVSHOW,
      contentImage:
          "https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 7.5,
      contentDate: DateTime(2016, 04, 16),
      contentSeason: 1,
      contentEpisodes: 6,
      isMovie: false,
    ),
    Content(
      contentName: "Joker",
      contentType: ContentEnum.MOVIE,
      contentImage: "https://tr.web.img4.acsta.net/pictures/19/09/11/16/43/1511539.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 1.6,
      contentDate: DateTime(2021, 12, 05),
      isMovie: true,
    ),
    Content(
      contentName: "Nomadland",
      contentType: ContentEnum.MOVIE,
      contentImage:
          "https://www.ubuy.com.tr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFIR295TTlhdFMuX1NMMTUwMF8uanBn.jpg",
      contentDescription:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      contentPoints: 5,
      contentDate: DateTime(2012, 09, 04),
      contentSeason: 8,
      contentEpisodes: 13,
      isMovie: false,
    ),
  ];
  List<Content> movieContents = [];
  List<Content> tvShowContents = [];

  //* Texts
  final String _populerTvShow = "Populer TV Shows";
  final String _populerMovies = "Populer Movies";
  late Content latestContent;
  //! Methods

  //* Film ve Dizilerin Listesi oluşturuldu.
  void fetchMovieAndTvShow() {
    for (var i = 0; i < contents.length; i++) {
      if (contents[i].isMovie) {
        movieContents.add(contents[i]);
      } else {
        tvShowContents.add(contents[i]);
      }
    }
  }

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

  //* Son eklenen film veya dizinin ana ekranda gösterilmesini sağlayan method.
  void getLatestContent() {
    latestContent = contents[0];
    for (var i = 0; i < contents.length - 1; i++) {
      if (latestContent.contentDate.isBefore(contents[i + 1].contentDate)) {
        latestContent = contents[i + 1];
      }
    }
    notifyListeners();
  }

  //! Future Methods

  //! Get Set Methods
  String get populerTvShow => _populerTvShow;
  String get populerMovies => _populerMovies;
}
