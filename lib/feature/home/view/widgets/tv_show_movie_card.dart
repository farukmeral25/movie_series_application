import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class TvShowMovieCard extends StatelessWidget {
  const TvShowMovieCard({Key? key, required this.content}) : super(key: key);
  final Content content;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Api bağlantısı yapılınca request atılması gerekiyor. Detay sayfasının initState'inde
        Go.to.page(
          TVSHOWMOVIEDETAILPAGEROUTE,
          arguments: SeriesMovieArgument(content: content),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          content.contentImage,
          fit: BoxFit.fill,
          height: ScreenSize().getHeightPercent(.23),
          width: ScreenSize().getWidthPercent(.36),
        ),
      ),
    );
  }
}
