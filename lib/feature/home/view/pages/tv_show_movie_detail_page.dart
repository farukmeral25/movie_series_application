// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';

class TvShowMovieDetailPage extends StatelessWidget {
  const TvShowMovieDetailPage({Key? key, required this.content}) : super(key: key);
  final Content content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: CustomScrollView(
        slivers: [
          HomeAppBar(
            content: content,
            isDetail: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSeriesSeasonsAndEpisodesInfos(),
                      Text(
                        content.isMovie ? "First Air Date" : "Release Date",
                        style: AppTextStyles.latoBold18Pt.copyWith(
                          fontSize: 14,
                          color: AppColors.softGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, bottom: 20),
                        child: Text(
                          DateUtil().dateToIDayIMonthIYear(date: content.contentDate),
                          style: AppTextStyles.latoBold18Pt.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "Description",
                          style: AppTextStyles.latoBold18Pt.copyWith(
                            fontSize: 14,
                            color: AppColors.softGrey,
                          ),
                        ),
                      ),
                      Text(
                        content.contentDescription,
                        style: AppTextStyles.latoBold18Pt.copyWith(
                          fontSize: 14,
                          color: AppColors.saltWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeriesSeasonsAndEpisodesInfos() {
    return Visibility(
      visible: !content.isMovie,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seasons",
                  style: AppTextStyles.latoBold18Pt.copyWith(
                    fontSize: 14,
                    color: AppColors.softGrey,
                  ),
                ),
                Text(
                  content.contentSeason.toString(),
                  style: AppTextStyles.latoBold18Pt.copyWith(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Total Episodes",
                  style: AppTextStyles.latoBold18Pt.copyWith(
                    fontSize: 14,
                    color: AppColors.softGrey,
                  ),
                ),
                Text(
                  content.contentEpisodes.toString(),
                  style: AppTextStyles.latoBold18Pt.copyWith(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
