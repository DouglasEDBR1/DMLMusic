import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/music_player_controller.dart';


class MediaPlayer extends StatefulWidget {
  const MediaPlayer({Key? key}) : super(key: key);

  @override
  State<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();

  @override
  void initState() {
    super.initState();

    mediaPlayerController.audioCache = AudioCache(fixedPlayer: mediaPlayerController.audioPlayer);
   // mediaPlayerController.onPlayedComplete();

    mediaPlayerController.audioPlayer?.onDurationChanged.listen((Duration d) {
      if (mounted){
        setState(() {
          mediaPlayerController.timeToMusic = d;
          mediaPlayerController.musicLength = d;
        });
      }
    });

    mediaPlayerController.audioPlayer?.onAudioPositionChanged.listen((Duration  p) => {
      if(mounted){
        setState(() {
          mediaPlayerController.audioDuration = p;
          mediaPlayerController.musicProgress = p;
        })
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return musicPlayBuild();
  }


  // ########### SLIDE BUILDER  ####################

  Widget sliderBuild() {
    return Observer( builder: (_) =>
        ContainerPlus(
          width: 400.0,
          height: 30,
          child: Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
              value: mediaPlayerController.audioDuration.inSeconds.toDouble(),
              min: 0,
              max: mediaPlayerController.timeToMusic.inSeconds.toDouble()+1.0,
              onChanged: (value) {
                mediaPlayerController.seekToSec(value.toInt());
              }),
        ),
    );
  }

  // Player

  Widget musicPlayBuild() {
    return ContainerPlus(
      color: Colors.black,
      child: ContainerPlus(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 0),
          child: ContainerPlus(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sliderBuild(),
                ContainerPlus(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextPlus(
                        mediaPlayerController.timeProgress,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      //const SizedBox(width: 280,),
                      TextPlus(
                        mediaPlayerController.totalTime,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Observer(builder: (_) => Row(
                        children: [
                          IconButton(
                            iconSize: 50,
                            color: Colors.white,
                            onPressed: () {
                              mediaPlayerController.previous();
                            },
                            icon: const Icon(
                              Icons.skip_previous,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          ContainerPlus(
                            radius: RadiusPlus.all(20),
                            border: BorderPlus(color: Colors.white),
                            child: Observer(builder: (_) =>
                                IconButton(
                                  iconSize: 54,
                                  color: Colors.white,
                                  onPressed: () {
                                    if (!mediaPlayerController.playing) {
                                      mediaPlayerController.resume();
                                    } else
                                    if (mediaPlayerController.playing) {
                                      mediaPlayerController.pause();
                                    }
                                  },
                                  icon: Icon(
                                    mediaPlayerController.btn,
                                  ),
                                ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          IconButton(
                            iconSize: 50,
                            color: Colors.white,
                            onPressed: () {
                              mediaPlayerController.next();
                              setState(() {
                               // mediaPlayerController.stop();

                              });
                            },
                            icon: const Icon(
                              Icons.skip_next,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
