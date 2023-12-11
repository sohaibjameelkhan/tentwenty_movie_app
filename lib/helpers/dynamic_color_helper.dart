

import '../Utils/app_colors.dart';

getDynamicColor(int index) {
  if (index == 0) {
    return AppColors.lightGreen;
  } else if (index == 1) {
    return AppColors.pinkColor;
  } else if (index == 2) {
    return AppColors.purpleColor;
  } else if (index == 3) {
    return AppColors.goldColor;
  } else {
    return AppColors.lightGreen;
  }
}
