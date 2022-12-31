// import 'dart:ffi';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VidioList extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  VidioList({required this.videoPlayerController, required this.looping});
 

  @override
  State<VidioList> createState() => _VidioListState();
}

class _VidioListState extends State<VidioList> {
  late ChewieController chewieController;

  @override
  void initState(){
    super.initState();

    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.looping,
      autoPlay: false,
      // autoInitialize: true,
      aspectRatio: 3/2,
      errorBuilder: (context, errorMessage) {
        return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Chewie(controller: chewieController),
    );
  }
  @override
  void dispose(){
    super.dispose();
    chewieController.dispose();
  }
}