// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/core/init/_init_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';
import 'package:provider/provider.dart';

class TvShowMovieDetailPage extends StatefulWidget {
  const TvShowMovieDetailPage({Key? key, required this.contentIndex, required this.type}) : super(key: key);
  final int contentIndex;
  final ContentEnum type;

  @override
  State<TvShowMovieDetailPage> createState() => _TvShowMovieDetailPageState();
}

class _TvShowMovieDetailPageState extends State<TvShowMovieDetailPage> {
  @override
  void initState() {
    super.initState();
    serviceLocator<HomeProvider>().fetchTvShowDetail(index: widget.contentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Consumer<HomeProvider>(
        builder: (context, HomeProvider homeProvider, child) {
          return homeProvider.progress
              ? Center(child: CupertinoActivityIndicator())
              : CustomScrollView(
                  slivers: [
                    HomeAppBar(
                      contentIndex: widget.contentIndex,
                      type: widget.type,
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
                                  widget.type == ContentEnum.TVSHOW ? "First Air Date" : "Release Date",
                                  style: AppTextStyles.latoBold18Pt.copyWith(
                                    fontSize: 14,
                                    color: AppColors.softGrey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0, bottom: 20),
                                  child: Text(
                                    DateUtil().dateToIDayIMonthIYear(date: _getDateTime()),
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
                                  _getOverview(),
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
                );
        },
      ),
    );
  }

  String _getOverview() {
    if (widget.type == ContentEnum.TVSHOW) {
      return serviceLocator<HomeProvider>().tvShowContent.overview!;
    } else {
      return serviceLocator<HomeProvider>().movieContents[widget.contentIndex].overview;
    }
  }

  DateTime _getDateTime() {
    if (widget.type == ContentEnum.TVSHOW) {
      return serviceLocator<HomeProvider>().tvShowContent.firstAirDate!;
    } else {
      return serviceLocator<HomeProvider>().movieContents[widget.contentIndex].releaseDate;
    }
  }

  Widget _buildSeriesSeasonsAndEpisodesInfos() {
    return Visibility(
      visible: widget.type == ContentEnum.TVSHOW,
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
                  serviceLocator<HomeProvider>().tvShowContent.seasons.toString(),
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
                  serviceLocator<HomeProvider>().tvShowContent.episodes.toString(),
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
