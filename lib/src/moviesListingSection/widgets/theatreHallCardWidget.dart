import 'package:flutter/material.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/models/custom_theaters_models.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';

class TheatreHallCardWidget extends StatelessWidget {
  final TheaterModel theaterModel;
  final Color borderColor;

  const TheatreHallCardWidget(
      {Key? key, required this.theaterModel, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                theaterModel.time.toString(),
                style: titleMedium(context)!.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                theaterModel.hallName.toString(),
                style: titleMedium(context)!.copyWith(
                    color: AppColors.lightBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 140,
            width: 230,
            //    margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(width: 1, color: borderColor),
              // image: const DecorationImage(
              //     image: AssetImage(
              //   ImageConstants.map,
              // ))

              // Customize the date item appearance
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(ImageConstants.map),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "From ",
                style: titleMedium(context)!.copyWith(
                    color: AppColors.lightBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${theaterModel.price}\$ ",
                style: titleMedium(context)!.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Or ",
                style: titleMedium(context)!.copyWith(
                    color: AppColors.lightBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${theaterModel.bonus} bonus",
                style: titleMedium(context)!.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
