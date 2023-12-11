import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  static String route = "/DashBoardScreen";
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
