import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isLoop;
  VideoPlayer({@required this.isLoop, @required this.videoPlayerController});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.isLoop,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}

class VideoDisplay extends StatefulWidget {
  final String videoUrl;
  VideoDisplay({@required this.videoUrl});

  @override
  State<VideoDisplay> createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: VideoPlayer(
        isLoop: true,
        videoPlayerController: VideoPlayerController.network(widget.videoUrl),
      ),
    );
  }
}
