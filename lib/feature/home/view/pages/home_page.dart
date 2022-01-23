// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/core/init/_init_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.saltBlack,
      body: Consumer<HomeProvider>(
        builder: (context, HomeProvider homeProvider, child) {
          return homeProvider.progress
              ? _buildProgress()
              : CustomScrollView(
                  slivers: [
                    HomeAppBar(),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  serviceLocator<HomeProvider>().populerTvShow,
                                  style: AppTextStyles.latoBold18Pt.copyWith(
                                    fontSize: 20,
                                    color: AppColors.saltWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _buildPopulerTvShows(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  serviceLocator<HomeProvider>().populerMovies,
                                  style: AppTextStyles.latoBold18Pt.copyWith(
                                    fontSize: 20,
                                    color: AppColors.saltWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _buildPopulerMovies(),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Center _buildProgress() {
    return Center(
      child: Platform.isIOS ? CupertinoActivityIndicator() : CircularProgressIndicator(),
    );
  }

  Widget _buildPopulerTvShows() {
    return Consumer<HomeProvider>(
      builder: (context, HomeProvider homeProvider, child) {
        return SizedBox(
          height: ScreenSize().getHeightPercent(.25),
          child: ListView.separated(
            controller: homeProvider.tvShowScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.tvShowContents.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == (homeProvider.tvShowContents.length)
                  ? _buildProgress()
                  : TvShowMovieCard(
                      contentIndex: index,
                      type: ContentEnum.TVSHOW,
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 20,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPopulerMovies() {
    return Consumer<HomeProvider>(
      builder: (context, HomeProvider homeProvider, child) {
        return SizedBox(
          height: ScreenSize().getHeightPercent(.25),
          child: ListView.separated(
            controller: homeProvider.movieScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.movieContents.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == (homeProvider.movieContents.length)
                  ? _buildProgress()
                  : TvShowMovieCard(
                      contentIndex: index,
                      type: ContentEnum.MOVIE,
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 20,
              );
            },
          ),
        );
      },
    );
  }
}
