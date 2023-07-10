import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoMediaPlayer extends StatefulWidget {
  const VideoMediaPlayer({Key? key, required this.videoId}) : super(key: key);
  final String videoId;

  @override
  State<VideoMediaPlayer> createState() => _VideoMediaPlayerState();
}

class _VideoMediaPlayerState extends State<VideoMediaPlayer> {

  late final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      )
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dx > sensitivity) {
          Navigator.pop(context);
        } else if(details.delta.dx < -sensitivity){
          //Left Swipe
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context , player ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                player
              ],
            );
          },
        ),
      ),
    );
  }
}
