import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

import 'home_video_screen.dart';


class HomeVideo extends StatefulWidget {
  const HomeVideo({Key? key}) : super(key: key);

  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {

  int currentIndex = 0;
  final List<Widget> _children = [
    const HomeVideoScreen(),
    ContainerPlus(),
    ContainerPlus(),
    ContainerPlus(),
    ContainerPlus()
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        iconSize: 20,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house_sharp, size: 30,),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot, size: 30,),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, size: 30,),
              label: 'Add'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined, size: 30,),
            label: 'Inscrições',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined, size: 30,),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
