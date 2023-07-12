import 'package:dml_music/screens/video/home_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';

import '../../controllers/video_player_controller.dart';

class SearchVideoScreen extends StatefulWidget {
  const SearchVideoScreen({Key? key}) : super(key: key);

  @override
  State<SearchVideoScreen> createState() => _SearchVideoScreenState();
}

class _SearchVideoScreenState extends State<SearchVideoScreen> {

  final VideoPlayerController _videoPlayerController = VideoPlayerController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_videoPlayerController.search != null && _videoPlayerController.search != '') {
      searchController.text = _videoPlayerController.search!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.black45,
        appBar: _buildAppBar(),
        body: ContainerPlus(
          color: Colors.black45,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black45,
      leadingWidth: 24,
      titleSpacing: 16,
      //automaticallyImplyLeading: false,
      title: Observer(builder: (_) => ContainerPlus(
          width: 300,
            height: 40,
            child: TextField(
              textAlign: TextAlign.center,
              controller: searchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  suffixIcon: InkWell(
                    onTap: (){
                     // _videoPlayerController.search = null;
                      searchController.clear();
                    },
                      child: const Icon(Icons.clear, color: Colors.black)
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  borderSide:  BorderSide(color: Color.fromRGBO(126, 132, 138, 1),),
                ),
                  hintStyle: const TextStyle(color: Colors.black38),
                  hintText: "Search",
              ),
            )),
      ),
      actions: [
        Observer(builder: (_) => IconButton(
              onPressed: () {
                _videoPlayerController.search = searchController.text;
                _videoPlayerController.getVideo();
                Navigator.of(context).pop;
                //   _videoPlayerController.getVideo().then((value) {
                //   if (value != null) {
                //     Navigator.of(context).pop;
                //   }
                // });
               // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeVideoScreen()));
              },
              icon: const Icon(Icons.search)
          ),
        )
      ],
    );
  }
}
