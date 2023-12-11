import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/search_screen.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';
import '../providers/movie_listing_provider.dart';
import '../widgets/movies_listing_card_widget.dart';

class MoviesListingScreen extends StatefulWidget {
  static String route = "/MoviesListingScreen";

  const MoviesListingScreen({Key? key}) : super(key: key);

  @override
  State<MoviesListingScreen> createState() => _MoviesListingScreenState();
}

class _MoviesListingScreenState extends State<MoviesListingScreen> {
  @override
  void initState() {
    context.read<MovieListingProvider>().getUpcomingMoviesListProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListingProvider>(
        builder: (context, moviesListingProvider, __) {
      return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Watch",
                        style: titleMedium(context)!.copyWith(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(SearchScreen.route, extra: {});
                        },
                        child: SvgPicture.asset(
                          ImageConstants.search,
                          height: 25,
                          width: 25,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
        body: moviesListingProvider.moviesListingModel == null
            ? const Center(
                child: SpinKitSpinningLines(
                color: AppColors.lightBlueColor,
                size: 30,
              ))
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(top: 0, left: 8, right: 8),
                        itemCount: moviesListingProvider
                            .moviesListingModel!.results!.length,
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var data = moviesListingProvider
                              .moviesListingModel!.results![index];
                          return MoviesListingCardWidget(
                            result: data,
                          );
                        }),
                  )
                ],
              ),
      );
    });
  }
}
