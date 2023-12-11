import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

import '../../helpers/routes_helper.dart';

showSuccessSnackBarMessage({required String message}) {
  ScaffoldMessenger.of(RoutesUtils.cNavigatorState.currentState!.context)
      //  ..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      //  backgroundColor: AppTheme.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        // style: titleMedium(RoutesUtils.cNavigatorState.currentState!.context)!
        //     .copyWith(
        //         overflow: TextOverflow.visible,
        //         color: AppColors.whiteColor,
        //         fontSize: SizesUtils.fifteen),
        //  overflow: TextOverflow.visible,
      ),
    ),
  );
}

showErrorSnackBarMessage({required String message}) {
  ScaffoldMessenger.of(RoutesUtils.cNavigatorState.currentState!.context)
      //..hideCurrentSnackBar()
      .showSnackBar(
    SnackBar(
      backgroundColor: AppColors.redColor,
      behavior: SnackBarBehavior.floating,
      //clipBehavior: Clip.none,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(
        message,
        // style: titleMedium(RoutesUtils.cNavigatorState.currentState!.context)!
        //     .copyWith(
        //         overflow: TextOverflow.visible,
        //         color: AppColors.whiteColor,
        //         fontSize: SizesUtils.fifteen),
        // overflow: TextOverflow.visible,
      ),
    ),
  );
}
