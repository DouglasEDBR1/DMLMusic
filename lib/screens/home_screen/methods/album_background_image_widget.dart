import 'package:dml_music/utils/media_player_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../../controllers/music_player_controller.dart';
import '../../media_player/media_player.dart';
import '../../media_player/methods/player_visualization/player_visualization.dart';
import 'album_card_method.dart';


class AlbumBackgroundImageWidget extends StatefulWidget {
  const AlbumBackgroundImageWidget({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  State<AlbumBackgroundImageWidget> createState() => _AlbumBackgroundImageWidgetState();
}

class _AlbumBackgroundImageWidgetState extends State<AlbumBackgroundImageWidget> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();

  @override
  void initState(){
    super.initState();
    mediaPlayerController.colorBackground;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => FutureBuilder<PaletteGenerator>(
          future: mediaPlayerController.predominantColor,
          builder: (context, AsyncSnapshot<PaletteGenerator> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return loadingScreen();
              case ConnectionState.active:
              case ConnectionState.done:
              default:
                if (snapshot.hasError) {
                  return loadingScreen();
                } else {
                  dynamic _bgColor = snapshot.data?.dominantColor?.color;

                  return ContainerPlus(
                    gradient: GradientPlus.linear(
                      colors: [
                        mediaPlayerController.imageAlbumTitle != '' ||
                            (mediaPlayerController.myPlaylistImage != '' && mediaPlayerController.myPlaylistImage != null)
                            ? _bgColor
                            : Colors.purple,
                        mediaPlayerController.imageAlbumTitle != '' ||
                            (mediaPlayerController.myPlaylistImage != '' && mediaPlayerController.myPlaylistImage != null)
                            ? _bgColor
                            : Colors.black,
                        mediaPlayerController.imageAlbumTitle != '' ||
                            (mediaPlayerController.myPlaylistImage != '' && mediaPlayerController.myPlaylistImage != null)
                            ? _bgColor
                            : Colors.black,
                        mediaPlayerController.imageAlbumTitle != '' ||
                            (mediaPlayerController.myPlaylistImage != '' && mediaPlayerController.myPlaylistImage != null)
                            ? _bgColor
                            : Colors.black,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    ),
                    child: Column(
                      children: [
                        appBarBuild(_bgColor, _bgColor, _bgColor),
                        Expanded(
                          child: mediaPlayerController.imageAlbumTitle != '' &&
                                  !mediaPlayerController.isPlaylist
                              ? ContainerPlus(
                                  shadows: [
                                      ShadowPlus(
                                          color: Colors.black54,
                                          spread: 2,
                                          blur: 5,
                                          moveDown: 4)
                                    ],
                                  radius: RadiusPlus.all(20),
                                  child: Image.asset(
                                      'assets/images/${mediaPlayerController.imageAlbum.toString()}',
                                      height: widget.height))
                              : mediaPlayerController.myPlaylistImage != '' &&
                              mediaPlayerController.myPlaylistImage != null &&
                                      mediaPlayerController.isPlaylist
                                  ? ContainerPlus(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 16),
                                      child: ContainerPlus(
                                        shadows: [
                                          ShadowPlus(
                                              color: Colors.black54,
                                              spread: 2,
                                              blur: 5,
                                              moveDown: 4),
                                        ],
                                        radius: RadiusPlus.all(20),
                                        child: Image.file(
                                          MediaPlayerUtil.imageFile(
                                              '${mediaPlayerController.myPlaylistImage}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : const PlayerVisualization(),
                        ),
                        const TitleAlbumWidget(),
                        const Flexible(child: MediaPlayer()),
                        //  SizedBox(height: 20,)
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  // ############      APPBAR      ###############

  Widget appBarBuild(Color color1, Color color2, Color color3){
    return ContainerPlus(
      padding: const EdgeInsets.only(top: 54, left: 16, right: 16, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          // Visibility(
          //   visible: false,
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.of(context).pop();
          //     },
          //     child: Icon(
          //         Icons.arrow_back_ios,
          //         color: color1.computeLuminance() > 0.5 ? Colors.black : Colors.white.withOpacity(0.6)
          //     ),
          //   ),
          // ),
          ContainerPlus(
            width: 28,
          ),
          ContainerPlus(
              height: 4,
              width: 42,
              radius: RadiusPlus.all(10),
              color: color1.computeLuminance() > 0.5 ? Colors.black : Colors.white.withOpacity(0.6)
          ),
          InkWell(
            onTap: (){
              // pickFile();
            },
            child: Icon(
              Icons.ios_share,
              size: 28,
              color: color1.computeLuminance() > 0.5 ? Colors.black : Colors.white.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }


  // ############     SCREEN LOADING     ################

  Widget loadingScreen(){
    return ContainerPlus(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white,),),
    );
  }


}
