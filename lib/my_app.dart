import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_movie_app/src/bottomNavBarSection/provider/bottom_navbar_provider.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/providers/book_seat_provider.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/providers/movie_listing_provider.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/providers/seat_provider.dart';

import 'Utils/app_theme.dart';
import 'helpers/routes_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BookSeatProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SeatProvider(),
          ),
          ChangeNotifierProvider(create: (context) => MovieListingProvider()),
        ],
        child: ScreenUtilInit(
          // designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          scaleByHeight: true,
          builder: (context, child) => const AppMaterial(),
        ));
  }
}

class AppMaterial extends StatefulWidget {
  const AppMaterial({
    Key? key,
  }) : super(key: key);

  @override
  State<AppMaterial> createState() => _AppMaterialState();
}

class _AppMaterialState extends State<AppMaterial> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: MaterialApp.router(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        routerConfig: routerConfigs,
      ),
    );
  }
}
