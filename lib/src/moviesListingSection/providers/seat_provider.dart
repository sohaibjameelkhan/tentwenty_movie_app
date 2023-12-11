import 'package:flutter/foundation.dart';
import 'package:tentwenty_movie_app/Utils/log_utils.dart';

import '../models/seats_model.dart';
import '../models/selected_seat_model.dart';

class SeatProvider with ChangeNotifier {
  List<List<Seat>> seats = [];
  List<SelectedSeatModel> selectedSeats = [];

  SeatProvider() {
    // Initialize seats (10 rows, 24 columns)
    for (int i = 0; i < 10; i++) {
      List<Seat> rowSeats = [];
      for (int j = 0; j < 24; j++) {
        // Define seat types and prices
        SeatType type = SeatType.regular;
        int price = 50;

        if (i == 2 && (j == 5 || j == 18)) {
          type = SeatType.vip;
          price = 150;
        } else if (i == 4 && j == 12) {
          type = SeatType.notAvailable;
        }

        rowSeats.add(Seat(row: i, column: j, type: type, price: price));
      }
      seats.add(rowSeats);
    }
  }

  void updateSeatType(int row, int column, SeatType newType) {
    if (seats[row][column].type != SeatType.notAvailable) {
      seats[row][column].type = newType;
      if (newType == SeatType.selected) {
        seats[row][column].price = seats[row][column].price;
        //selectedSeats.add('Row: $row, Column: $column');
        selectedSeats.add(SelectedSeatModel(row.toString(), column.toString()));
        dp(msg: "selected seats", arg: selectedSeats.toString());
      } else {
        seats[row][column].price = 0;

        selectedSeats
            .remove(SelectedSeatModel(row.toString(), column.toString()));

        dp(msg: "selected seats", arg: selectedSeats.toString());
      }
      notifyListeners();
    }
  }

  removeSelectedSeats(int index) {
    selectedSeats.removeAt(index);
    notifyListeners();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var seat in seats.expand((row) => row)) {
      if (seat.type == SeatType.selected) {
        totalPrice += seat.price;
      }
    }
    return totalPrice;
  }
}
