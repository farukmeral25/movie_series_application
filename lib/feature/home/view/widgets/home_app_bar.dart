// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/core/init/_init_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    this.contentIndex,
    this.type,
    this.isDetail = false,
  }) : super(key: key);
  final bool isDetail;
  final int? contentIndex;
  final ContentEnum? type;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.saltBlack,
      actions: [
        if (isDetail) ...[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => Go.to.back(),
              child: CircleAvatar(
                backgroundColor: AppColors.saltBlack,
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: AppColors.saltWhite,
                ),
              ),
            ),
          )
        ]
      ],
      bottom: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: ScreenSize().getHeightPercent(.18),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<HomeProvider>(
                builder: (context, HomeProvider homeProvider, child) {
                  if (isDetail) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: homeProvider.colorFromPoints(_getVoteAverage()),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.saltBlack,
                            child: Text(
                              _getVoteAverage().toString(),
                              style: AppTextStyles.latoBold18Pt.copyWith(
                                fontSize: 12,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: ScreenSize().getWidthPercent(.5),
                                child: Text(
                                  type == ContentEnum.MOVIE
                                      ? serviceLocator<HomeProvider>().movieContents[contentIndex!].originalTitle
                                      : serviceLocator<HomeProvider>().tvShowContent.originalTitle!,
                                  style: AppTextStyles.latoBold18Pt.copyWith(
                                    color: AppColors.saltWhite,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                type!.contentTypeText(),
                                style: AppTextStyles.latoBold18Pt.copyWith(
                                  fontSize: 14,
                                  color: AppColors.softGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: ScreenSize().getWidthPercent(.6),
                          child: Text(
                            homeProvider.latestMovieContent.originalTitle,
                            style: AppTextStyles.latoBold18Pt.copyWith(
                              color: AppColors.saltWhite,
                            ),
                          ),
                        ),
                        Text(
                          homeProvider.latestMovieContent.type!.contentTypeText(),
                          style: AppTextStyles.latoBold18Pt.copyWith(
                            fontSize: 14,
                            color: AppColors.softGrey,
                          ),
                        ),
                        Text(
                          "Latest Content",
                          style: AppTextStyles.latoBold18Pt.copyWith(
                            fontSize: 12,
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              AppFilledButton("Watch")
            ],
          ),
        ),
      ),
      pinned: true,
      floating: true,
      expandedHeight: ScreenSize().getHeightPercent(.4),
      flexibleSpace: Stack(
        children: [
          Consumer<HomeProvider>(builder: (context, HomeProvider homeProvider, child) {
            return Image.network(
              _getPosterPath(),
              fit: BoxFit.fill,
              height: ScreenSize().getHeightPercent(.45),
              width: ScreenSize().getWidthPercent(1),
            );
          }),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0,
                  .55,
                  1,
                ],
                colors: [
                  AppColors.saltWhite.withOpacity(0),
                  AppColors.saltBlack.withOpacity(.41),
                  AppColors.black,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  double _getVoteAverage() {
    if (type == ContentEnum.MOVIE) {
      return serviceLocator<HomeProvider>().movieContents[contentIndex!].voteAverage;
    } else if (type == ContentEnum.TVSHOW) {
      return serviceLocator<HomeProvider>().tvShowContent.voteAverage!;
    } else
      return 0;
  }

  String _getPosterPath() {
    if (type == ContentEnum.MOVIE) {
      return serviceLocator<HomeProvider>().movieContents[contentIndex!].posterPath;
    } else if (type == ContentEnum.TVSHOW) {
      return serviceLocator<HomeProvider>().tvShowContent.posterPath;
    } else {
      return serviceLocator<HomeProvider>().latestMovieContent.posterPath;
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
