import 'package:dio/dio.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/models/movie_details_model.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/models/movies_listing_model.dart';

import '../../../Utils/api_constants.dart';
import '../../../helpers/dio_helper.dart';
import '../../commonWidgets/snak_bar_widget.dart';

class MoviesListingService {
  static DioServices dio = DioServices();

  ///get all upcoming movies List

  Future<MoviesListingModel?> getAllUpcomingMoviesListing() async {
    Response? response = await dio.get(Apis.upcomingMovies);
    //var jsonResponse = jsonDecode(response!.body);
    if (response.statusCode == 200) {
    } else {
      showErrorSnackBarMessage(
          message: response.data["status"]
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", ""));
    }
    return MoviesListingModel.fromJson(response.data);
  }

  ///get all upcoming movies List

  Future<MovieDetailsModel?> getMovieDetails(String movieID) async {
    Response? response = await dio.get("/$movieID");
    //var jsonResponse = jsonDecode(response!.body);
    if (response.statusCode == 200) {
    } else {
      showErrorSnackBarMessage(
          message: response.data["status"]
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", ""));
    }
    return MovieDetailsModel.fromJson(response.data);
  }
}
