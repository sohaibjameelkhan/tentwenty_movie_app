import 'package:flutter/cupertino.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/models/movie_details_model.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/models/movies_listing_model.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/services/movies_listing_service.dart';

import '../../../Utils/log_utils.dart';

class MovieListingProvider extends ChangeNotifier {
  MoviesListingService moviesListingService = MoviesListingService();
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  MoviesListingModel? moviesListingModel;

  getUpcomingMoviesListProvider() async {
    await Future.delayed(const Duration(microseconds: 1));
    makeLoadingTrue();
    moviesListingModel = await moviesListingService
        .getAllUpcomingMoviesListing()
        .whenComplete(() {
      makeLoadingFalse();
    });

    notifyListeners();

    dp(msg: "movies listing model print", arg: moviesListingModel!.toJson());
  }

  MovieDetailsModel? movieDetailsModel;

  getMovieDetailsProvider(String movieID) async {
    await Future.delayed(const Duration(microseconds: 1));
    makeLoadingTrue();
    movieDetailsModel =
        await moviesListingService.getMovieDetails(movieID).whenComplete(() {
      makeLoadingFalse();
    });

    notifyListeners();

    dp(
        msg: "movies listing details model print",
        arg: moviesListingModel!.toJson());
  }
}
