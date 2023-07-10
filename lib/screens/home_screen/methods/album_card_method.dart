import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import '../../../controllers/music_player_controller.dart';


class TitleAlbumWidget extends StatefulWidget {
  const TitleAlbumWidget({Key? key}) : super(key: key);

  @override
  State<TitleAlbumWidget> createState() => _TitleAlbumWidgetState();
}

class _TitleAlbumWidgetState extends State<TitleAlbumWidget> {

  dynamic mediaPlayerController = GetIt.I<MediaPLayerController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => ContainerPlus(
      child: ContainerPlus(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextPlus(
              mediaPlayerController.music != ''
                  ? mediaPlayerController.musicTitle.toString()
                  : mediaPlayerController.myPlaylist,
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              textOverflow: TextOverflow.visible,
              padding: const EdgeInsets.only(left: 14, top: 22),
            ),
            const SizedBox(height: 4),
            TextPlus(
              mediaPlayerController.bandTitle != ''
                  ? mediaPlayerController.band.toString()
                  : mediaPlayerController.bandTitle,
              color: Colors.white.withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
