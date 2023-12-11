import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_movie_app/Utils/image_constants.dart';

import '../../../Utils/app_colors.dart';
import '../provider/bottom_navbar_provider.dart';

class BottomNavScreen extends StatefulWidget {
  final int? index;
  static String route = "/BottomNavScreen";

  const BottomNavScreen({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, provider, __) {
      return WillPopScope(
          onWillPop: () async {
            if (provider.currentIndex != 0) {
              provider.updateCurrentScreen(0);
              return false;
            }
            if (provider.currentIndex == 0) {
              return true;
            }
            return false;
          },
          child: Scaffold(
            body: Consumer<BottomNavProvider>(
              builder: (context, provider, child) {
                return provider.currentScreen;
              },
            ),
            bottomNavigationBar: Consumer<BottomNavProvider>(
                builder: (context, provider, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20), bottom: Radius.circular(0)),
                      child: BottomNavigationBar(
                          elevation: 0.0,
                          currentIndex: provider.currentIndex,
                          backgroundColor: AppColors.bottomNavbarColor,
                          type: BottomNavigationBarType.fixed,
                          selectedFontSize: 12,
                          unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor.withOpacity(0.9)),
                          selectedLabelStyle: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                          selectedItemColor: AppColors.whiteColor,
                          onTap: (index) {
                            provider.updateCurrentScreen(index);
                          },
                          items: [
                            bottomNavItem(
                              path: ImageConstants.dashboard,
                              selectedColor: provider.currentIndex == 0
                                  ? AppColors.whiteColor
                                  : AppColors.whiteColor.withOpacity(0.5),
                              label: "Dashboard",
                            ),
                            bottomNavItem(
                              path: ImageConstants.watch,
                              height: 21,
                              width: 21,
                              selectedColor: provider.currentIndex == 1
                                  ? AppColors.whiteColor
                                  : AppColors.whiteColor.withOpacity(0.5),
                              label: "Watch",
                            ),
                            bottomNavItem(
                              path: ImageConstants.media,
                              selectedColor: provider.currentIndex == 2
                                  ? AppColors.whiteColor
                                  : AppColors.whiteColor.withOpacity(0.5),
                              label: "Media Library",
                            ),
                            bottomNavItem(
                              path: ImageConstants.more,
                              selectedColor: provider.currentIndex == 3
                                  ? AppColors.whiteColor
                                  : AppColors.whiteColor.withOpacity(0.5),
                              label: "More",
                            ),
                          ]),
                    ),
                  ),
                ],
              );
            }),
          ));
    });
  }

  bottomNavItem({
    double? height,
    double? width,
    required Color selectedColor,
    required String path,
    required final String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(
          path,
          height: height,
          width: width,
          color: selectedColor,
        ),
      ),
      label: label,
    );
  }
}
