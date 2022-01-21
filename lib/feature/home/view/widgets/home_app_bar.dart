// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/_feature_exports.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    required this.content,
    this.isDetail = false,
  }) : super(key: key);
  final bool isDetail;
  final Content content;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
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
                          backgroundColor: homeProvider.colorFromPoints(
                            content.contentPoints,
                          ),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.saltBlack,
                            child: Text(
                              content.contentPoints.toString(),
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
                              Text(
                                content.contentName,
                                style: AppTextStyles.latoBold18Pt.copyWith(
                                  color: AppColors.saltWhite,
                                ),
                              ),
                              Text(
                                content.contentType.contentTypeText(),
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
                        Text(
                          homeProvider.latestContent.contentName,
                          style: AppTextStyles.latoBold18Pt.copyWith(
                            color: AppColors.saltWhite,
                          ),
                        ),
                        Text(
                          homeProvider.latestContent.contentType.contentTypeText(),
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
              content.contentImage,
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

  @override
  Size get preferredSize => Size.fromHeight(50);
}
