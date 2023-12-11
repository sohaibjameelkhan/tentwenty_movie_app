import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Utils/log_utils.dart';

class MovieTrailerScreen extends StatefulWidget {
  final String trainlerkey;
  static String route = "/MovieTrailerScreen";

  MovieTrailerScreen({required this.trainlerkey});

  @override
  _MovieTrailerScreenState createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    dp(msg: "video id ", arg: widget.trainlerkey.toString());

    // Lock screen orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Initialize YouTube player controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.trainlerkey.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(listener);
  }

  @override
  void dispose() {
    // Dispose of the YouTube player controller
    _controller.dispose();

    // Allow all orientations when the screen is disposed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.dispose();
  }

  void listener() {
    if (_controller.value.playerState == PlayerState.ended) {
      // Video has ended, navigate back to the previous screen
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onEnded: (val) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ]);
                // _controller.dispose();
                //Navigator.maybePop(context);
              },
              progressIndicatorColor: Colors.blueAccent,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
            builder: (context, player) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Wrap the YoutubePlayer widget in a container to adjust its size
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: player,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class TrailerScreen extends StatefulWidget {
//   final String trainlerkey;
//   static String route = "/TrailerScreen";
//
//   const TrailerScreen({Key? key, required this.trainlerkey}) : super(key: key);
//
//   @override
//   State<TrailerScreen> createState() => _TrailerScreenState();
// }
//
// class _TrailerScreenState extends State<TrailerScreen> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     setScreenLandScapeMode();
//     _controller = YoutubePlayerController(
//         initialVideoId: widget.trainlerkey.toString(),
//         flags: const YoutubePlayerFlags(
//           mute: false,
//           loop: false,
//           autoPlay: true,
//         ));
//     super.initState();
//   }
//
//   setScreenLandScapeMode() async {
//     await SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeLeft]);
//   }
//
//   @override
//   void deactivate() {
//     _controller.pause();
//     _controller.dispose();
//
//     super.deactivate();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//         ),
//         builder: (context, player) {
//           return WillPopScope(
//             onWillPop: () async {
//               await SystemChrome.setPreferredOrientations(
//                   [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
//               return true;
//             },
//             child: Scaffold(
//               body: Column(
//                 children: [
//                   player,
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
