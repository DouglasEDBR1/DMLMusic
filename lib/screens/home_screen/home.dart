import 'package:dml_music/screens/home_screen/home_screen.dart';
import 'package:dml_music/screens/settings/settings_screen.dart';
import 'package:dml_music/screens/playlist/playlist_screen.dart';
import 'package:dml_music/screens/video/home_video_screen.dart';
import 'package:flutter/material.dart';
// import '../player_local_storage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  final List<Widget> _children = [
    // const MediaPlayerLocalStorage(),
    const HomeScreen(),
    const SettingsScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[currentIndex!],

      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.black,
        buttonBackgroundColor: const Color(0xFF282626),
        color: const Color(0xFF1C1B1B),
        animationDuration: const Duration(milliseconds: 460),
        items: const [
          Icon(Icons.playlist_play, size: 30, color: Colors.white,),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
      ),


      // extendBody: false,
      // bottomNavigationBar:  DotNavigationBar(
      //   dotIndicatorColor: Colors.white,
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      //   enableFloatingNavBar: false,
      //   borderRadius: 10,
      //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
      //   currentIndex: currentIndex!,
      //   onTap: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   // enableFloatingNavBar: false
      //   items: [
      //     DotNavigationBarItem(
      //       icon: const Icon(Icons.music_video),
      //       selectedColor: Colors.purple,
      //     ),
      //
      //     /// Likes
      //     DotNavigationBarItem(
      //       icon: const Icon(Icons.home),
      //       selectedColor: Colors.lightBlueAccent,
      //
      //     ),
      //
      //     /// Search
      //     DotNavigationBarItem(
      //       icon: const Icon(Icons.settings),
      //       selectedColor: Colors.orange,
      //     ),
      //
      //   ],
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white.withOpacity(0.6),
      //   currentIndex: currentIndex!,
      //   onTap: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items:  [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //           Icons.folder_copy_sharp ,
      //           size: 30,
      //           color: currentIndex != 0 ? Colors.white.withOpacity(0.6) : Colors.white),
      //       label: 'Off-line',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //           Icons.house_sharp,
      //           size: 30,
      //           color: currentIndex != 1 ? Colors.white.withOpacity(0.6) : Colors.white),
      //       label: 'Início',
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //             Icons.settings,
      //             size: 30,
      //             color: currentIndex != 2 ? Colors.white.withOpacity(0.6) : Colors.white),
      //         label: 'Configurações'
      //     ),
      //   ],
      // ),
    );
  }

}