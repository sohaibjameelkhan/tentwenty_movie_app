import 'package:flutter/cupertino.dart';


import '../../../Utils/image_constants.dart';
import '../models/custom_theaters_models.dart';

class BookSeatProvider extends ChangeNotifier {
  /// horizontal date picker

  DateTime? selectedDate;
  List<DateTime> dates = [];
  TheaterModel? theaterModelVar;

  addDates() {
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      for (int i = 0; i < 30; i++) {
        dates.add(DateTime.now().add(Duration(days: i)));
      }
      notifyListeners();
    });
  }

  updateTheatreModel(TheaterModel theaterModel) {
    theaterModelVar = theaterModel;
    notifyListeners();
  }

  updateDate(DateTime dateTime) {
    selectedDate = dateTime;
    notifyListeners();
  }

  List<TheaterModel> halls = [
    TheaterModel(
        "12:30", "Cinetech + hall 1", ImageConstants.map, "100", "2500"),
    TheaterModel(
        "12:45", "Finetech + hall 2", ImageConstants.map, "200", "4500"),
    TheaterModel(
        "1:30", "Hinetech + hall 3", ImageConstants.map, "500", "3500"),
    TheaterModel("3:30", "Linetech + hall 4", ImageConstants.map, "20", "3500"),
    TheaterModel("5:30", "Binetech + hall 5", ImageConstants.map, "10", "6500")
  ];
}
