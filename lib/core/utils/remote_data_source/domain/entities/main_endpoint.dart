// ignore_for_file: constant_identifier_names

enum MainEndpoints {
  FETCH_POPULER_MOVIE,
  FETCH_POPULER_TV_SHOW,
  FETCH_POPULER_TV_SHOW_DETAIL,
}

enum MainEndpointsType {
  POST,
  GET,
  MULTI_PART_FORM_DATA,
}

const String apiKey = "0921a11ff74eb51180882534314e79af";
late int id;
int _moviePage = 0;
int _tvShowPage = 0;

extension MainEndPointExtension on MainEndpoints {
  String stateToEndpoint() {
    switch (this) {
      case MainEndpoints.FETCH_POPULER_MOVIE:
        return "3/movie/popular?api_key=$apiKey&language=en-US&page=$_moviePage";
      case MainEndpoints.FETCH_POPULER_TV_SHOW:
        return "3/tv/popular?api_key=$apiKey&language=en-US&page=$_tvShowPage";
      case MainEndpoints.FETCH_POPULER_TV_SHOW_DETAIL:
        return "https://api.themoviedb.org/3/tv/$id?api_key=0921a11ff74eb51180882534314e79af&language=en-US";
    }
  }

  void appendPage() {
    switch (this) {
      case MainEndpoints.FETCH_POPULER_MOVIE:
        _moviePage++;
        break;
      case MainEndpoints.FETCH_POPULER_TV_SHOW:
        _tvShowPage++;
        break;
      case MainEndpoints.FETCH_POPULER_TV_SHOW_DETAIL:
        break;
    }
  }

  void getId({required int index}) {
    id = index;
  }

  MainEndpointsType stateToMethodType() {
    switch (this) {
      case MainEndpoints.FETCH_POPULER_TV_SHOW:
      case MainEndpoints.FETCH_POPULER_MOVIE:
      case MainEndpoints.FETCH_POPULER_TV_SHOW_DETAIL:
        return MainEndpointsType.GET;

      // return MainEndpointsType.POST;

      // return MainEndpointsType.MULTI_PART_FORM_DATA;

    }
  }
}
