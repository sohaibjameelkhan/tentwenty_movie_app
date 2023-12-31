import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/select_date_screen.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/trailer_screen.dart';

import '../../../Utils/api_constants.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';
import '../../../Utils/text_constants.dart';
import '../../../helpers/dynamic_color_helper.dart';

import '../../commonWidgets/button_widget.dart';
import '../../commonWidgets/cacheNetworkImageWidget.dart';
import '../providers/movie_listing_provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  static String route = "/MovieDetailsScreen";
  final String movieID;

  const MovieDetailsScreen({Key? key, required this.movieID}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    context
        .read<MovieListingProvider>()
        .getMovieDetailsProvider(widget.movieID);
    context
        .read<MovieListingProvider>()
        .getMovieTrailersProvider(widget.movieID);
    context.read<MovieListingProvider>().getMovieImagesProvider(widget.movieID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListingProvider>(
        builder: (context, movieListingProvider, __) {
      return WillPopScope(
        onWillPop: () async {
          movieListingProvider.movieDetailsModel = null;
          return true;
        },
        child: Scaffold(
          body: movieListingProvider.movieDetailsModel == null ||
                  movieListingProvider.movieTrailersModel == null
              ? const Center(
                  child: SpinKitSpinningLines(
                  color: AppColors.purpleColor,
                  size: 35,
                ))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CacheNetworkImageWidget(
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              imgUrl: Apis.imageBaseUrl +
                                  movieListingProvider
                                      .movieDetailsModel!.posterPath
                                      .toString(),
                              radius: 0),
                          Positioned(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 45,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.maybePop(context);
                                    movieListingProvider.movieDetailsModel =
                                        null;
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageConstants.back,
                                        color: AppColors.whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Watch",
                                        style: titleMedium(context)!.copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 120,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "In theaters ",
                                      style: titleMedium(context)!.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      movieListingProvider
                                          .movieDetailsModel!.releaseDate!
                                          .format("F-d-Y"),
                                      style: titleMedium(context)!.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CommonButtonWidget(
                                  text: 'Get Tickets',
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(SelectDateScreen.route, extra: {
                                      TextConstants.movieName:
                                          movieListingProvider
                                              .movieDetailsModel!.originalTitle
                                              .toString(),
                                      TextConstants.releaseDate:
                                          movieListingProvider
                                              .movieDetailsModel!.releaseDate!
                                              .format("F-d-Y")
                                    });
                                  },
                                  radius: 11,
                                  iconColor: AppColors.lightBlueColor,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CommonButtonWidget(
                                  text: 'Watch Trailer',
                                  onTap: () {
                                    GoRouter.of(context)
                                        .push(MovieTrailerScreen.route, extra: {
                                      TextConstants.trailerKey:
                                          movieListingProvider
                                              .movieTrailersModel!
                                              .results!
                                              .first
                                              .key
                                              .toString()
                                    });
                                  },
                                  radius: 11,
                                  showIcon: true,
                                  backgroundcolor: Colors.transparent,
                                  iconColor: AppColors.whiteColor,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Genres",
                              style: titleMedium(context)!.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: SizedBox(
                          height: 37,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 12, right: 12),
                              itemCount: movieListingProvider
                                  .movieDetailsModel!.genres!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var data = movieListingProvider
                                    .movieDetailsModel!.genres![index].name;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                    height: 35,
                                    //  width: 95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(23),
                                        color: getDynamicColor(index)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Center(
                                          child: Text(
                                        data.toString(),
                                        style: titleMedium(context)!.copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Overview",
                              style: titleMedium(context)!.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: movieListingProvider
                                .movieDetailsModel!.overview
                                .toString(),
                            style: titleSmall(context)!.copyWith(
                                color: AppColors.lightBlackColor,
                                fontSize: 14,
                                letterSpacing: 0.2,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Images",
                              style: titleMedium(context)!.copyWith(
                                  color: AppColors.blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      movieListingProvider.movieImagesModel == null
                          ? const SpinKitSpinningLines(
                              size: 40, color: AppColors.backgroundColor)
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: GridView.builder(
                                padding: EdgeInsets.only(top: 0),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      2, // Number of items in each row
                                  crossAxisSpacing:
                                      12.0, // Spacing between columns
                                  mainAxisSpacing: 8.0, // Spacing between rows
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: movieListingProvider
                                    .movieImagesModel!.posters!.length,
                                itemBuilder: (context, index) {
                                  return CacheNetworkImageWidget(
                                      imgUrl: Apis.imageBaseUrl +
                                          movieListingProvider.movieImagesModel!
                                              .posters![index].filePath
                                              .toString(),
                                      radius: 13);
                                },
                              ),
                            )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
