import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/movie_details_screen.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/select_date_screen.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/select_seat_screen.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/trailer_screen.dart';

import '../Utils/text_constants.dart';
import '../src/bottomNavBarSection/screens/bottomNavScreen.dart';
import '../src/dashboardSection/screens/dashboard_screen.dart';
import '../src/mediaLibrarySection/screens/media_library_screen.dart';
import '../src/moreSection/screens/more_screen.dart';
import '../src/moviesListingSection/screens/movies_listing_screen.dart';

GlobalKey<NavigatorState> navstate = GlobalKey<NavigatorState>();

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n ",
    );

class RoutesUtils {
  //

  static var cNavigatorState = GlobalKey<NavigatorState>();

  static BuildContext context = cNavigatorState.currentState!.context;
}

Future<T?> toNext<T>({required Widget widget}) => Navigator.push<T?>(
      RoutesUtils.context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => widget,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );

toRemoveAll({required Widget widget}) => Navigator.pushAndRemoveUntil(
    RoutesUtils.context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
    (c) => false);

var routerConfigs = GoRouter(
  initialLocation: BottomNavScreen.route,
  navigatorKey: RoutesUtils.cNavigatorState,
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: BottomNavScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(
            child: BottomNavScreen(
                //   index: 1,
                ));
      },
    ),
    GoRoute(
      path: MoviesListingScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: MoviesListingScreen());
      },
    ),

    GoRoute(
      path: TrailerScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: TrailerScreen());
      },
    ),

    GoRoute(
      path: MovieDetailsScreen.route,
      pageBuilder: (BuildContext context, GoRouterState state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
          child: MovieDetailsScreen(
            movieID: extra?[TextConstants.movieId],
          ),
        );
      },
    ),

    GoRoute(
      path: SelectDateScreen.route,
      pageBuilder: (BuildContext context, GoRouterState state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
          child: SelectDateScreen(
            movieName: extra?[TextConstants.movieName],
            releaseDate: extra?[TextConstants.releaseDate],
          ),
        );
      },
    ),
    GoRoute(
      path: SelectSeatScreen.route,
      pageBuilder: (BuildContext context, GoRouterState state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
          child: SelectSeatScreen(
            hallName: extra?[TextConstants.hallName],
            selectedDate: extra?[TextConstants.selectedDate],
            movieName: extra?[TextConstants.movieName],
          ),
        );
      },
    ),
    GoRoute(
      path: MoreScreen.route,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: MoreScreen());
      },
    ),
    GoRoute(
      path: MediaLibraryScreen.route,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: MediaLibraryScreen());
      },
    ),
    GoRoute(
      path: DashBoardScreen.route,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: DashBoardScreen());
      },
    ),
    // GoRoute(
    //   path: VerifyEmailCodeScreen.route,
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     var extra = state.extra as Map<String, dynamic>?;
    //     return NoTransitionPage(
    //       child: VerifyEmailCodeScreen(email: extra?[TextUtils.email]),
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: SubmitCommitteesScreen.route,
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     var extra = state.extra as Map<String, dynamic>?;
    //     return NoTransitionPage(
    //         child: SubmitCommitteesScreen(
    //       committeeId: extra?[TextUtils.committeeID],
    //       userID: extra?[TextUtils.userID],
    //       committeeNo: extra?[TextUtils.committeeNo],
    //     ));
    //   },
    // ),
    // GoRoute(
    //   path: InviteMembers.route,
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     var extra = state.extra as Map<String, dynamic>?;
    //     return NoTransitionPage(
    //         child: InviteMembers(
    //       groupId: extra?[TextUtils.groupId],
    //       addInGroup: extra?[TextUtils.addInGroup],
    //     ));
    //   },
    // ),
  ],
);
