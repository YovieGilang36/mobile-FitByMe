import 'package:chewie/chewie.dart';
import 'package:fitbyme/program/resep/vidio.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVidio extends StatefulWidget {
  final String vidio;
  const PlayVidio({Key? key, required this.vidio}) : super(key: key);
  @override
  State<PlayVidio> createState() => _PlayVidioState();
}

class _PlayVidioState extends State<PlayVidio> {
   late VideoPlayerController _videoPlayerController;
   ChewieController _chewieController = ChewieController(videoPlayerController: VideoPlayerController.network("http://192.168.43.205/Web-fitbyme/vidio/"));

  Future<void> lihatVidio() async {
    _videoPlayerController = VideoPlayerController.network(widget.vidio);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      // autoInitialize: true,
      looping: true,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    lihatVidio();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 250,
        child: _chewieController != null &&
                _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController)
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
