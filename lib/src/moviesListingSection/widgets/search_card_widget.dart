import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';
import '../../commonWidgets/cacheNetworkImageWidget.dart';

class SearchCardWidget extends StatelessWidget {
  const SearchCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CacheNetworkImageWidget(
                  height: 90, width: 120, imgUrl: "", radius: 13),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Timless",
                    style: titleMedium(context)!.copyWith(
                        color: AppColors.blackColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Fantasy",
                    style: titleMedium(context)!.copyWith(
                        color: AppColors.lightBlackColor.withOpacity(0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          SvgPicture.asset(ImageConstants.threeDots)
        ],
      ),
    );
  }
}
