import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import '../controllers/music_player_controller.dart';
import '../controllers/picker_file_controller.dart';


class CardAlbumImage extends StatefulWidget {
  const CardAlbumImage({Key? key, required this.imageAlbum, required this.music, required this.bandTitle, required this.albumTitle, required this.musicPlay, required this.track}) : super(key: key);

  final String imageAlbum;
  final String music;
  final String bandTitle;
  final String albumTitle;
  final int musicPlay;
  final int track;

  @override
  State<CardAlbumImage> createState() => _CardAlbumImageState();
}

class _CardAlbumImageState extends State<CardAlbumImage> {

  final dynamic mediaPlayerController = GetIt.I<MediaPLayerController>();
  final pickerFileController = GetIt.I<PickerFileController>();


  @override
  Widget build(BuildContext context) {
    return ContainerPlus(
      color: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Observer(
          builder: (_) => InkWell(
            onTap: (){
              mediaPlayerController.stop();
              mediaPlayerController.setImageAlbumTitle(widget.imageAlbum);
              mediaPlayerController.setMusic(widget.music);
              mediaPlayerController.setBandTitle(widget.bandTitle);
              mediaPlayerController.setAlbumTitle(widget.albumTitle);
              mediaPlayerController.setMusicPlay(widget.musicPlay);
              mediaPlayerController.predominantColor = mediaPlayerController.updatePaletteGenerator();
              mediaPlayerController.play();
              mediaPlayerController.playAudioFromLocalStorage(pickerFileController.fileToDisplay);
              mediaPlayerController.setI(widget.track);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ContainerPlus(
                      radius: RadiusPlus.all(16),
                      width: 80,
                      height: 80,
                      child: widget.imageAlbum != ''
                          ? Image.asset('assets/images/${widget.imageAlbum}')
                          : Image.asset('assets/images/apple_music.jpeg')
                    ),
                    const SizedBox(width: 14,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContainerPlus(
                          child: TextPlus(
                            widget.music,
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        ContainerPlus(
                          child: TextPlus(
                            widget.track.toString(),
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
