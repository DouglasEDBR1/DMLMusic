import 'package:audioplayers/audioplayers.dart';
import 'package:dml_music/screens/media_player/methods/player_visualization/player_visualization.dart';
import 'package:dml_music/utils/media_player_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/music_player_controller.dart';


class MiniMediaPlayer extends StatefulWidget {
  const MiniMediaPlayer({Key? key}) : super(key: key);

  @override
  State<MiniMediaPlayer> createState() => _MiniMediaPlayerState();
}

class _MiniMediaPlayerState extends State<MiniMediaPlayer> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();

  @override
  void initState() {
    super.initState();

    mediaPlayerController.audioCache = AudioCache(fixedPlayer: mediaPlayerController.audioPlayer);

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
          mediaPlayerController.musicProgress =p;
        })
      }
    });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  }


  @override
  Widget build(BuildContext context) {

    return musicPlayBuild();
  }


 // ########### SLIDE BUILDER  ####################

  Widget sliderBuild() {
    return Observer( builder: (_) =>
        ContainerPlus(
          width: 360.0,
          child: Slider.adaptive(
              activeColor: Colors.green,
              inactiveColor: Colors.white,
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
          padding: const EdgeInsets.only(bottom: 0, top: 4, left: 6, right: 6),
          child: ContainerPlus(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               // sliderBuild(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                    children: [
                      const SizedBox(width: 10,),
                      ContainerPlus(
                            radius: RadiusPlus.all(10),
                            height: 42,
                            width: 42,
                            child: mediaPlayerController.imageAlbumTitle != '' && !mediaPlayerController.isPlaylist
                                ? Image.asset('assets/images/${mediaPlayerController.imageAlbum.toString()}')
                                : mediaPlayerController.myPlaylistImage != '' &&
                                mediaPlayerController.myPlaylistImage != null &&
                                mediaPlayerController.isPlaylist
                                    ? Image.file(MediaPlayerUtil.imageFile(
                                mediaPlayerController.myPlaylistImage.toString()),
                              fit: BoxFit.cover,
                            )
                                    : const PlayerVisualization()),
                        const SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextPlus(
                              mediaPlayerController.music != ''
                                  ? mediaPlayerController.musicTitle.toString()
                                  : mediaPlayerController.myPlaylist,
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextPlus(
                            mediaPlayerController.bandTitle != ''
                              ?mediaPlayerController.band.toString()
                              : mediaPlayerController.bandTitle,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                    Row(
                      children: [
                        IconButton(
                          iconSize: 26,
                          color: Colors.white,
                          onPressed: () {
                            mediaPlayerController.play();
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
                                iconSize: 28,
                                color: Colors.white,
                                onPressed: () {
                                  if (!mediaPlayerController.playing) {
                                    mediaPlayerController.resume();
                                  } else
                                  if (mediaPlayerController.playing == true) {
                                    mediaPlayerController.pause();
                                  } else if (mediaPlayerController.playerState ==
                                      PlayerState.STOPPED) {
                                    mediaPlayerController.play();
                                  }
                                },
                                icon: Icon(
                                  mediaPlayerController.btn,
                                  size: 28,
                                ),
                              ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    )
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
