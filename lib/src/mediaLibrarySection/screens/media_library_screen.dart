import 'package:flutter/material.dart';

class MediaLibraryScreen extends StatelessWidget {
  static String route = "/MediaLibraryScreen";
  const MediaLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Media Library"),
      ),
    );
  }
}
