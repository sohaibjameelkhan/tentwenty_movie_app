import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_movie_app/src/commonWidgets/button_widget.dart';
import 'package:tentwenty_movie_app/src/moviesListingSection/providers/seat_provider.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_theme.dart';
import '../../../Utils/image_constants.dart';
import '../models/seats_model.dart';

class SelectSeatScreen extends StatefulWidget {
  static String route = "/SelectSeatScreen";
  final String movieName;
  final String hallName;
  final String selectedDate;

  const SelectSeatScreen(
      {Key? key,
      required this.hallName,
      required this.selectedDate,
      required this.movieName})
      : super(key: key);

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  TransformationController transformationController =
      TransformationController();
  double _scale = 1.0;
  double _baseScale = 1.0;

  void _zoomIn() {
    setState(() {
      _scale = (_scale * 1.5).clamp(0.5, 2.0); // Increase scale by 1.5 times
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale / 1.5).clamp(0.5, 2.0); // Decrease scale by 1.5 times
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeatProvider>(builder: (context, seatProvider, __) {
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColors.lightBlackColor.withOpacity(0.2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Price",
                            style: titleMedium(context)!.copyWith(
                                color: AppColors.blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            seatProvider.getTotalPrice().toString() + " \$",
                            // "50\$",
                            style: titleMedium(context)!.copyWith(
                                color: AppColors.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 7,
                    child: CommonButtonWidget(
                        text: "Proceed to pay",
                        onTap: () {},
                        horizontalPadding: 0,
                        radius: 13,
                        iconColor: AppColors.lightBlueColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            seatProvider.selectedSeats.clear();

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
                          Row(
                            children: [
                              Text(
                                "${widget.selectedDate}",
                                style: titleMedium(context)!.copyWith(
                                    color: AppColors.lightBlueColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                " | ",
                                style: titleMedium(context)!.copyWith(
                                    color: AppColors.lightBlueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                widget.hallName,
                                style: titleMedium(context)!.copyWith(
                                    color: AppColors.lightBlueColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
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
            Container(
              height: 400,
              decoration: const BoxDecoration(color: AppColors.backgroundColor),
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: -150,
                          // bottom: -10,
                          child: Image.asset(
                            ImageConstants.screen,
                            height: 200,
                            width: 400,
                          )),
                      GestureDetector(
                        onScaleStart: (ScaleStartDetails details) {
                          _baseScale = _scale;
                        },
                        onScaleUpdate: (ScaleUpdateDetails details) {
                          setState(() {
                            _scale = _baseScale * details.scale.clamp(0.5, 2.0);
                          });
                        },
                        child: Transform.scale(
                          scale: _scale,
                          child: Container(
                            height: 250,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    itemCount: seatProvider.seats.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.5),
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: GridView.builder(
                                    itemCount: seatProvider.seats.length *
                                        seatProvider.seats[0].length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 24,
                                            childAspectRatio: 0.7,
                                            crossAxisSpacing: 0.5),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      int row = index ~/ 24;
                                      int column = index % 24;

                                      final seat =
                                          seatProvider.seats[row][column];

                                      Color seatColor = Colors
                                          .grey; // Default color for regular seats

                                      switch (seat.type) {
                                        case SeatType.selected:
                                          seatColor = AppColors.goldColor;
                                          break;
                                        case SeatType.notAvailable:
                                          seatColor = Colors.grey;
                                          break;
                                        case SeatType.vip:
                                          seatColor = AppColors.purpleColor;
                                          break;
                                        case SeatType.regular:
                                          seatColor = AppColors.lightBlueColor;
                                          break;
                                      }

                                      return GestureDetector(
                                        onTap: () {
                                          seatProvider.updateSeatType(
                                              row,
                                              column,
                                              seat.type == SeatType.selected
                                                  ? SeatType.regular
                                                  : SeatType.selected);
                                        },
                                        child: Container(
                                          child: SvgPicture.asset(
                                            ImageConstants.seat,
                                            color: seatColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //  Spacer(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: _zoomIn,
                          child: Container(
                            height: 45,
                            width: 45,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Center(
                                child: SvgPicture.asset(ImageConstants.addIcon),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: _zoomOut,
                          child: Container(
                            height: 45,
                            width: 45,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              child: Center(
                                child: SvgPicture.asset(ImageConstants.minus),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageConstants.seat,
                        color: AppColors.goldColor,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Selected",
                        style: titleMedium(context)!.copyWith(
                            color: AppColors.lightBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageConstants.seat,
                        color: AppColors.lightBlackColor,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Not available",
                        style: titleMedium(context)!.copyWith(
                            color: AppColors.lightBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageConstants.seat,
                        color: AppColors.purpleColor,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "VIP (150\$)",
                        style: titleMedium(context)!.copyWith(
                            color: AppColors.lightBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageConstants.seat,
                        color: AppColors.lightBlueColor,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Regular (50 \$)",
                        style: titleMedium(context)!.copyWith(
                            color: AppColors.lightBlackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 50,
                //  width: double.minPositive,
                child: ListView.builder(
                  itemCount: seatProvider.selectedSeats.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var data = seatProvider.selectedSeats[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${int.parse(data.column) + 1}/${int.parse(data.row) + 1} Row",
                                  style: titleMedium(context)!.copyWith(
                                      color: AppColors.lightBlackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                InkWell(
                                  onTap: () {
                                    seatProvider.removeSelectedSeats(index);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
