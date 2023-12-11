enum SeatType { selected, notAvailable, vip, regular }

class Seat {
  final int row;
  final int column;
  SeatType type;
  int price;

  Seat(
      {required this.row,
      required this.column,
      required this.type,
      this.price = 0});
}
