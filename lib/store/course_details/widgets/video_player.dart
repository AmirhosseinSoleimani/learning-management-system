import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key,this.data}) : super(key: key);
  final data;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {

  bool isLoading = false;
  late VideoPlayerController videoPlayerController;
  ChewieController? _controller;

  @override
  void initState() {
    startTimer();
    super.initState();
    _initPlayer();
  }
  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    await videoPlayerController.initialize();
    _controller = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: true,
        additionalOptions: (context){
          return <OptionItem>[
            OptionItem(
                onTap: () => debugPrint('1'),
                iconData: Icons.subtitles,
                title: 'Subtitle'
            ),
          ];
        }
    );
  }

  void startTimer(){
    Timer.periodic(
        const Duration(seconds: 8),
            (timer) {
          setState((){
            isLoading = true;
          });
        }
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width/1.2,
            child: isLoading ? Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/20),
              child: Chewie(
                controller: _controller!,
              ),
            ):
            SpinKitFadingCircle(
              size: MediaQuery.of(context).size.width,
              color: Colors.white,
            )
        ),
      ],
    );
  }
}

