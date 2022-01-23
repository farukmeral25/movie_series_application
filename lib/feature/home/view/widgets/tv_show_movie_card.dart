import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/core/init/_init_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class TvShowMovieCard extends StatelessWidget {
  const TvShowMovieCard({Key? key, required this.contentIndex, required this.type}) : super(key: key);
  final ContentEnum type;
  final int contentIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go.to.page(
          TVSHOWMOVIEDETAILPAGEROUTE,
          arguments: SeriesMovieArgument(contentIndex: contentIndex, type: type),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          type == ContentEnum.TVSHOW
              ? serviceLocator<HomeProvider>().tvShowContents[contentIndex].posterPath
              : serviceLocator<HomeProvider>().movieContents[contentIndex].posterPath,
          fit: BoxFit.fill,
          height: ScreenSize().getHeightPercent(.23),
          width: ScreenSize().getWidthPercent(.36),
        ),
      ),
    );
  }
}
