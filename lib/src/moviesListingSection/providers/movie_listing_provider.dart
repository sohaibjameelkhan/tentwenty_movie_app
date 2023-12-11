import 'package:flutter/cupertino.dart';

import '../../../Utils/log_utils.dart';
import '../models/movie_details_model.dart';
import '../models/movie_images_model.dart';
import '../models/movie_trailers_model.dart';
import '../models/movies_listing_model.dart';
import '../services/movies_listing_service.dart';

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

  MovieTrailersModel? movieTrailersModel;

  getMovieTrailersProvider(String movieID) async {
    await Future.delayed(const Duration(microseconds: 1));
    makeLoadingTrue();
    movieTrailersModel =
        await moviesListingService.getMovieTrailers(movieID).whenComplete(() {
      makeLoadingFalse();
    });

    notifyListeners();

    dp(msg: "movies trailers  model print", arg: movieTrailersModel!.toJson());
  }

  MovieImagesModel? movieImagesModel;

  getMovieImagesProvider(String movieID) async {
    await Future.delayed(const Duration(microseconds: 1));
    makeLoadingTrue();
    movieImagesModel =
        await moviesListingService.getMovieImages(movieID).whenComplete(() {
      makeLoadingFalse();
    });

    notifyListeners();

    dp(msg: "movies images  model print", arg: movieImagesModel!.toJson());
  }
}
