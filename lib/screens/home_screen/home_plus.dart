import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dml_music/screens/home_screen/methods/album_background_image_widget.dart';
import 'package:dml_music/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:miniplayer/miniplayer.dart';
import '../../controllers/music_player_controller.dart';
import '../playlist/playlist_screen.dart';
import 'home_screen.dart';
import '../media_player/mini_player.dart';


class HomePlusScreen extends StatefulWidget {
  const HomePlusScreen({Key? key}) : super(key: key);

  @override
  State<HomePlusScreen> createState() => _HomePlusScreenState();
}

class _HomePlusScreenState extends State<HomePlusScreen> {

  final _navigatorKey = GlobalKey();
  final mediaPlayerController = GetIt.I<MediaPLayerController>();

  @override
  void initState() {
    super.initState();
    mediaPlayerController.updatePaletteGenerator();
    mediaPlayerController.colorBackground;
  }

  int currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _children = [
    const PlaylistLocalScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MiniplayerWillPopScope(
      onWillPop: () async {
        final State<StatefulWidget>? navigator = _navigatorKey.currentState;
        if (!Navigator.canPop(context)) return true;
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            ContainerPlus(
              child: Navigator(
                key: _navigatorKey,
                onGenerateRoute: (RouteSettings settings) =>
                    MaterialPageRoute(
                      settings: settings,
                      builder: (BuildContext context) => _children[currentIndex],
                    ),
              ),
            ),
            bodyBuilder()
          ],
        ),
        // bottomNavigationBar: curvedNavigationBar(),
        bottomNavigationBar: Observer(builder: (_) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: mediaPlayerController.isVisible ? 70.0 : 0.0,
              child: _buildBottomNavigationBar()
        ),
        )
      ),
    );
  }

  Widget bodyBuilder(){

    final MiniplayerController controller = MiniplayerController();

    return Miniplayer(
      backgroundColor: Colors.black45.withOpacity(0.4),
      duration: const Duration(milliseconds: 540),
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: 60,
      controller: controller,
      builder: (height, percentage) {
        if(percentage > 0.54) {
          mediaPlayerController.getIsVisibleNavBar(false);
          return AlbumBackgroundImageWidget(height: height);
        }
        else{
          mediaPlayerController.getIsVisibleNavBar(true);
          return const MiniMediaPlayer();
        }
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Wrap(
      children: [
        BottomNavigationBar(
          backgroundColor: Colors.black,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                label: 'Playlist',
                icon: Icon(
              Icons.playlist_play)),
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(Icons.settings)),
          ],
          currentIndex: currentIndex,
          onTap: onTabTapped,
        ),
      ],
    );

    // return CurvedNavigationBar(
    //   index: 1,
    //   backgroundColor: Colors.black,
    //   buttonBackgroundColor: const Color(0xFF282626),
    //   color: const Color(0xFF1C1B1B),
    //   animationDuration: const Duration(milliseconds: 460),
    //   height: 70,
    //   items: const [
    //     Icon(
    //       Icons.playlist_play,
    //       size: 26,
    //       color: Colors.white,
    //     ),
    //     Icon(Icons.home, size: 30, color: Colors.white),
    //     Icon(Icons.settings, size: 26, color: Colors.white),
    //   ],
    //   onTap: (index) => setState(() {
    //     currentIndex = index;
    //   }),
    // );
  }

  Widget appBarBuild(Color color1, Color color2, Color color3){
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Visibility(
            visible: false,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(
                  Icons.arrow_back_ios,
                  color: color1.computeLuminance() > 0.5 ? Colors.black : Colors.white.withOpacity(0.6)
              ),
            ),
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

  Widget loadingScreen(){
    return ContainerPlus(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white,),),
    );
  }

}