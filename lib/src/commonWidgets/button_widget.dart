import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tentwenty_movie_app/Utils/app_theme.dart';
import 'package:tentwenty_movie_app/Utils/image_constants.dart';

import '../../Utils/app_colors.dart';

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color textcolor;
  final Color bordercolor;
  final Color backgroundcolor;
  final double radius;
  final double buttonHeight;
  final double textfont;
  final double horizontalPadding;
  final double? buttonwidth;
  final Color iconColor;
  final bool showIcon;

  const CommonButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    this.textcolor = Colors.white,
    this.bordercolor = AppColors.lightBlueColor,
    this.backgroundcolor = AppColors.lightBlueColor,
    this.radius = 33,
    this.buttonHeight = 55,
    this.buttonwidth,
    this.textfont = 17,
    this.horizontalPadding = 50,
    TextStyle? style,
    required this.iconColor,
    this.showIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Container(
          height: buttonHeight,
          width: buttonwidth,
          decoration: BoxDecoration(
            color: backgroundcolor,
            border: Border.all(width: 1.5, color: bordercolor),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showIcon == true) ...[
                  SvgPicture.asset(
                    ImageConstants.watch,
                    color: iconColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                Text(
                  text,
                  style: titleMedium(context)!.copyWith(
                    fontSize: textfont,
                    fontWeight: FontWeight.w500,
                    color: textcolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
