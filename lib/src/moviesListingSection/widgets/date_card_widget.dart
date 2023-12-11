import 'package:flutter/material.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';

class DateCardWidget extends StatelessWidget {
  final String text;
  final Color backGroundColor;

  const DateCardWidget(
      {Key? key, required this.text, required this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90, // Adjust the width as needed
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: backGroundColor, // Customize the date item appearance
      ),
      child: Center(
        child: Text(
          text,
          style: titleMedium(context)!.copyWith(
              color: AppColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
