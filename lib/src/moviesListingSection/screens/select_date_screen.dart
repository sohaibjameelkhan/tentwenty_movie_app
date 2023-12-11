import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/screens/select_seat_screen.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';
import '../../../Utils/text_constants.dart';
import '../../commonWidgets/button_widget.dart';
import '../../commonWidgets/snak_bar_widget.dart';
import '../providers/book_seat_provider.dart';
import '../widgets/date_card_widget.dart';
import '../widgets/theatreHallCardWidget.dart';

class SelectDateScreen extends StatefulWidget {
  static String route = "/SelectDateScreen";
  final String movieName;
  final String releaseDate;

  const SelectDateScreen(
      {Key? key, required this.movieName, required this.releaseDate})
      : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  @override
  void initState() {
    context.read<BookSeatProvider>().addDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookSeatProvider>(builder: (context, bookSeatProvider, __) {
      return Scaffold(
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonButtonWidget(
                text: "Select Seats",
                onTap: () {
                  if (bookSeatProvider.selectedDate == null) {
                    showErrorSnackBarMessage(message: "Please Select date");
                  } else if (bookSeatProvider.theaterModelVar == null) {
                    showErrorSnackBarMessage(message: "Please Select Hall");
                  } else {
                    GoRouter.of(context).push(SelectSeatScreen.route, extra: {
                      TextConstants.movieName: widget.movieName.toString(),
                      TextConstants.hallName:
                          bookSeatProvider.theaterModelVar!.hallName.toString(),
                      TextConstants.selectedDate:
                          bookSeatProvider.selectedDate!.format("F-d-Y")
                    });
                  }
                },
                showIcon: false,
                horizontalPadding: 20,
                radius: 9,
                iconColor: AppColors.lightBlueColor),
            const SizedBox(
              height: 20,
            )
          ],
        ),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: SvgPicture.asset(
                            ImageConstants.back,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            widget.movieName.toString(),
                            style: titleMedium(context)!.copyWith(
                                color: AppColors.blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "In theaters ${widget.releaseDate}",
                            style: titleMedium(context)!.copyWith(
                                color: AppColors.lightBlueColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Date",
                style: titleMedium(context)!.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Consumer<BookSeatProvider>(
                builder: (context, bookSeatProvider, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookSeatProvider.dates.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = bookSeatProvider.dates[index];

                      return GestureDetector(
                          onTap: () {
                            bookSeatProvider.updateDate(data);
                          },
                          child: DateCardWidget(
                            text: bookSeatProvider.dates[index].format("d-M"),
                            backGroundColor: bookSeatProvider.selectedDate ==
                                    data
                                ? AppColors.lightBlueColor
                                : AppColors.lightBlackColor.withOpacity(0.4),
                          ));
                    },
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 35,
            ),
            Consumer<BookSeatProvider>(
                builder: (context, bookSeatProvider, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookSeatProvider.halls.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = bookSeatProvider.halls[index];
                      return GestureDetector(
                          onTap: () {
                            bookSeatProvider.updateTheatreModel(data);
                          },
                          child: TheatreHallCardWidget(
                            theaterModel: data,
                            borderColor:
                                bookSeatProvider.theaterModelVar == data
                                    ? AppColors.lightBlueColor
                                    : AppColors.blackColor.withOpacity(0.1),
                          ));
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
