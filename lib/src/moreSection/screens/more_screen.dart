import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  static String route = "/MoreScreen";
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("More Screen"),
      ),
    );
  }
}
