import 'dart:async';
import 'package:dml_music/controllers/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import '../../controllers/home_controller.dart';
import '../../data/images.dart';
import '../../models/music_model.dart';
import '../../repositories/home_repository_mock.dart';
import '../video/home_video_screen.dart';
import 'package:music_visualizer/music_visualizer.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();
  final HomeController _controller = HomeController(HomeRepositoryMock());
  Timer? _timer;
  int _pos = 0;
  List<MusicList> playlist = [];
  ScrollController? hideBottomNavController;
  bool isVisible = true;

  _hiveBottomNavController() {
    hideBottomNavController = ScrollController();
    hideBottomNavController?.addListener(() {
      if (hideBottomNavController?.position.userScrollDirection == ScrollDirection.reverse) {
        if (isVisible) {
          isVisible = false;
          mediaPlayerController.getIsVisibleNavBar(isVisible);
        }
      }
      if (hideBottomNavController?.position.userScrollDirection == ScrollDirection.forward) {
        if (!isVisible) {
          isVisible = true;
          mediaPlayerController.getIsVisibleNavBar(isVisible);
        }
      }
    });
  }

  _timeChangeBackgroundImage(){
    _timer = Timer.periodic(const Duration(seconds: 16), (Timer t) {
      setState(() {
        _pos = (_pos + 1) % ImagesBackground.photos.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.fetch();
    _timeChangeBackgroundImage();
    _hiveBottomNavController();
    if (!mediaPlayerController.playing) {
      mediaPlayerController.onPlayedComplete();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            homeScreenBuild(),
            ContainerPlus(
              gradient: GradientPlus.linear(
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: appBarBuild(),
            ),
          ]
      ),
    );

  }

  // ##################       METHODS      ####################

  Widget image(Widget image){

    return ContainerPlus(child: image);
  }

  Widget homeScreenBuild(){

    return Observer(builder: (_) => ContainerPlus(
        child: Stack(
          children: [
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                body: ContainerPlus(
                  color: Colors.black87,
                  gradient: GradientPlus.linear(
                    colors: [
                     // Colors.black,
                      Colors.black,
                    //  const Color(0xF0000000),
                      const Color(0xD3000000),
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          controller: hideBottomNavController,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Positioned(
                                  top:-50,
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.black, Colors.transparent],
                                      ).createShader(Rect.fromLTRB(0, 240, rect.width, rect.height));
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: ImagesBackground.photos[_pos],
                                  ),
                                ),
                                ContainerPlus(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 240,),
                                      headerMyStation(
                                          'MINHA ESTAÇÃO',
                                          'MINHA TRILHA SONORA',
                                          'Baseada em Coldplay, Radiohead, Keane, e muito mais...'
                                      ),
                                      const SizedBox(height: 20,),
                                      Column(
                                        children: [
                                          headerListMusic('Músicas para você'),
                                          const SizedBox(height: 14,),
                                          ValueListenableBuilder<List<MusicList>>(
                                            valueListenable: _controller.musics, builder: (_, list, __){
                                            return ListView.builder(
                                                physics: const NeverScrollableScrollPhysics(),
                                                padding: const EdgeInsets.all(4),
                                                shrinkWrap: true,
                                                addRepaintBoundaries: true,
                                                addAutomaticKeepAlives: true,
                                                itemCount: list.length,
                                                itemBuilder: (_, index) {
                                                  mediaPlayerController.setPlaylist(list);
                                                  return  Observer(
                                                    builder: (_) => ContainerPlus(
                                                        padding: const EdgeInsets.only(bottom: 10),
                                                        child: cardAlbumImage(
                                                          list[index].id,
                                                          '${list[index].albumImage}',
                                                          '${list[index].music}',
                                                          '${list[index].band}',
                                                          '${list[index].album}',
                                                          '${list[index].musicPlay}',
                                                        ),
                                                    ),
                                                  );
                                                });
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 56,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ###########    ALBUM LIST    #############

  Widget imageAlbumList(String imageAlbumTitle, String titleAlbum, String bandMusic, String musicPlay){

    return Column(
      children: [
        ContainerPlus(
          shadows: [
            ShadowPlus(
                color: Colors.black54,
                spread: 1,
                blur: 5,
                moveDown: 4
            )
          ],
          radius: RadiusPlus.all(20),
          child: Image.asset('assets/images/$imageAlbumTitle', width: 370, height: 370,),
        ),
        TextPlus(
          musicPlay,
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          padding: const EdgeInsets.only(left: 14, top: 22),
        ),
        const SizedBox(height: 6,),
        TextPlus(
          bandMusic,
          color: Colors.white.withOpacity(0.5),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  // ############    SCREEN LOADING   ################

  Widget loadingScreen(){

    return ContainerPlus(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white,),),
    );
  }

  // ##############      RECOMMENDATIONS TITLE     ##########

  Widget headerMyStation(String header, String title, String subtitle){

    return ContainerPlus(
      padding: const EdgeInsets.only(left: 12),
      color: Colors.black87.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPlus(
            title,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            textOverflow: TextOverflow.clip,
            fontSize: 28,
          ),
          const SizedBox(height: 8,),
          TextPlus(
            subtitle,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 12,),

          TextPlus(
            header,
            color: const Color(0xFFB988FF),
            fontWeight: FontWeight.w900,
            textOverflow: TextOverflow.clip,
            fontSize: 16,
          ),
          const SizedBox(height: 14,),
        ],
      ),
    );
  }

  Widget appBarBuild(){
    return ContainerPlus(
      height: 100,
      padding:  const EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          ContainerPlus(
            border: BorderPlus(color: Colors.white.withOpacity(0.9), width: 1),
            radius: RadiusPlus.all(40),
            width: 46,
            height: 46,
            child: Image.asset('assets/images/bryan_adams.jpeg'),
          ),
          ContainerPlus(
            padding: const EdgeInsets.only(right: 22),
            child: Row(
              children: [
                // const SizedBox(width: 8,),
                ContainerPlus(
                  color: Colors.black.withOpacity(0.4),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  border: BorderPlus(color: Colors.white.withOpacity(0.6), width: 2),
                  radius: RadiusPlus.all(20),
                  child: TextPlus(
                    'Música',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 10,),
                InkWell(onTap: (){
                  displayDialog(
                      context,
                      const HomeVideoScreen()
                  );
                },
                  child: ContainerPlus(
                    color: Colors.black.withOpacity(0.4),
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    border: BorderPlus(color: Colors.white.withOpacity(0.6), width: 2),
                    radius: RadiusPlus.all(20),
                    child: TextPlus(
                      'Video',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }


  // ############      CARD ALBUM      ##############

  Widget cardAlbumImage([int? track, String? imageAlbum, String? music, String? bandTitle, String? albumTitle, String? musicPlay]){

    final List<Color> colors = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ];

    final List<int> duration = [800, 400, 600, 400];

    return ContainerPlus(
      color: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Observer(
          builder: (_) => InkWell(
                  onTap: (){
                    mediaPlayerController.checkPlaylist(false);
                    mediaPlayerController.stop();
                    mediaPlayerController.setImageAlbumTitle(imageAlbum!);
                    mediaPlayerController.setMusic(music!);
                    mediaPlayerController.setBandTitle(bandTitle!);
                    mediaPlayerController.setAlbumTitle(albumTitle!);
                    mediaPlayerController.setMusicPlay(musicPlay!);
                    mediaPlayerController.colorBackground;
                    mediaPlayerController.setId(track!);
                    mediaPlayerController.play();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              ContainerPlus(
                                radius: RadiusPlus.all(16),
                                width: 70,
                                height: 70,
                                child: Stack(
                                    children: [
                                      Image.asset('assets/images/$imageAlbum'),
                                      track == mediaPlayerController.id && mediaPlayerController.playing == true
                                          ? ContainerPlus(
                                         color: Colors.black87.withOpacity(0.4),
                                          height: 100,
                                          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
                                          child:  MusicVisualizer(
                                              colors: colors,
                                              duration: duration,
                                              barCount: 4,
                                              curve: Curves.easeInQuad,
                                          )
                                      ): ContainerPlus(),
                                    ]
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 14,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContainerPlus(
                                child: TextPlus(
                                  music,
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4,),
                              ContainerPlus(
                                child: TextPlus(
                                  bandTitle,
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

  // ##########   SONG FOR YOU / MORE    #################

  Widget headerListMusic(String title){
    return ContainerPlus(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextPlus(
            title,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          ContainerPlus(
            child: TextPlus(
              'Ver mais',
              color: const Color(0xFFB988FF),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  displayDialog(BuildContext context, dynamic pageRoute) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOutCirc;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return pageRoute;
      },
    );
  }

}
