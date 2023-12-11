import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/src/mediaLibrarySection/screens/media_library_screen.dart';
import 'package:tentwenty_movie_app/src/moreSection/screens/more_screen.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/movies_listing_screen.dart';

import '../../dashboardSection/screens/dashboard_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  Widget currentScreen = const DashBoardScreen();
  int currentIndex = 0;

  updateScreen(int index) {
    updateCurrentScreen(index);
  }

  updateCurrentScreen(int index) {
    switch (index) {
      case 0:
        currentIndex = index;
        currentScreen = const DashBoardScreen();
        notifyListeners();
        break;
      case 1:
        currentIndex = index;
        currentScreen = const MoviesListingScreen();
        notifyListeners();
        break;
      case 2:
        currentIndex = index;
        currentScreen = const MediaLibraryScreen();
        notifyListeners();

        break;
      case 3:
        currentIndex = index;
        currentScreen = const MoreScreen();
        notifyListeners();

        break;
    }
  }
}
