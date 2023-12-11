import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/api_constants.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/text_constants.dart';
import '../../commonWidgets/cacheNetworkImageWidget.dart';
import '../models/movies_listing_model.dart';
import '../screens/movie_details_screen.dart';

class MoviesListingCardWidget extends StatelessWidget {
  final Result result;

  const MoviesListingCardWidget({Key? key, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 0, right: 0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(MovieDetailsScreen.route,
                  extra: {TextConstants.movieId: result.id.toString()});
            },
            child: CacheNetworkImageWidget(
              height: 210,
              width: MediaQuery.of(context).size.width,
              imgUrl: Apis.imageBaseUrl + result.backdropPath.toString(),
              radius: 13,
            ),
          ),
          Positioned(
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 25),
                    child: Text(
                      result.originalTitle.toString(),
                      style: titleMedium(context)!.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ))
        ],
      ),
      // Container(
      //   height: 300,
      //   width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(
      //       color: AppColors.goldColor,
      //       borderRadius: BorderRadius.circular(13),
      //       image: DecorationImage(
      //           image: NetworkImage(
      //               Apis.imageBaseUrl + result.backdropPath.toString()))),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       CachedNetworkImage(
      //         height: 300,
      //         width: MediaQuery.of(context).size.width,
      //         imageUrl: Apis.imageBaseUrl + result.backdropPath.toString(),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 20, bottom: 25),
      //         child: Text(
      //           result.originalTitle.toString(),
      //           style: titleMedium(context)!.copyWith(
      //               color: AppColors.whiteColor,
      //               fontSize: 18,
      //               fontWeight: FontWeight.w500),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
