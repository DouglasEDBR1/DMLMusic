import 'package:dml_music/screens/video/video_media_play.dart';
import 'package:dml_music/widget/background_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:miniplayer/miniplayer.dart';
import '../../controllers/music_video_controller.dart';
import '../../models/video_model.dart';
import 'methods/custom_search_video.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomeVideoScreen extends StatefulWidget {
  const HomeVideoScreen({Key? key}) : super(key: key);

  @override
  _HomeVideoScreenState createState() => _HomeVideoScreenState();
}

class _HomeVideoScreenState extends State<HomeVideoScreen> {

  final MiniplayerController controller = MiniplayerController();
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(10);

  _listVideos(String search){
    Api api = Api();
    return api.search(search);
  }

  dynamic _videoId;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox.expand(
        child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              int sensitivity = 8;
              if (details.delta.dx > sensitivity) {
                Navigator.pop(context);
              } else if(details.delta.dx < -sensitivity){
                //Left Swipe
              }
            },
            child: Stack(
                children: [
                  bodyBuilder()
                ]
            )
        ),
      ),
    );
  }


  // ############## METHODS #################

  // #############    FUTUREBUILDER BODY   ################

  Widget bodyBuilder(){
    return ContainerPlus(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black87,
      child: Stack(
        children: [
         const BackgroundLayout(),
          ContainerPlus(
            padding: const EdgeInsets.only(top: 8),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContainerPlus(
                            child: TextPlus(
                              'VIDEOS',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 6,),
                          TextPlus(
                            'COLEÇÕES',
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,

                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          String? resultSearch = await showSearch(context: context, delegate: CustomSeachDelegate());
                          setState(() {
                            _result = resultSearch!;
                          });
                        },
                        child: const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 44,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14,),
                Expanded(
                  child: ContainerPlus(
                    //color: Colors.red,
                    child: FutureBuilder<List<Video>?>(
                        future: _listVideos(_result),
                        builder:(context, snapshot){
                          switch (snapshot.connectionState){
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                            case ConnectionState.done:
                              if( snapshot.hasData ){
                                return ListView.builder(
                                  padding: const EdgeInsets.all(4),
                                  physics: const BouncingScrollPhysics(),
                                  addAutomaticKeepAlives: true,
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index){

                                    List<Video>? videos = snapshot.data;
                                    Video? video = videos![index];

                                    return AnimationConfiguration.staggeredGrid(
                                      columnCount: 2,
                                      position: index,
                                      duration: const Duration(milliseconds: 375),
                                      child: GestureDetector(
                                          onTap: (){
                                            _videoId = video.id;
                                            displayDialog(context, VideoMediaPlayer(videoId: video.id!));
                                          },
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: ContainerPlus(
                                                  //     color: Colors.red,
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                                    child: listVideos(video.id, video.image, video.title, index)
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    );
                                  },
                                );
                              }else{
                                // return listVideos();
                                return const Center(
                                  child: Text('Nenhum dado encontrado!'),
                                );
                              }
                          }
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // ###############   METHOD LIST VIEW   ################

  Widget listVideos(dynamic video, var imageVideo, var titleVideo, int index){

    return Stack(
      children: [
        ContainerPlus(
          width: double.infinity,
          child: AnimationConfiguration.staggeredGrid(
            columnCount: 2,
            position: index,
            duration: const Duration(milliseconds: 375),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoMediaPlayer(videoId: video)),
                );
              },
              child: Container(
                //  padding: EdgeInsets.all(8),
                width: 340,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageVideo),
                      // image: AssetImage('assets/images/example_video.jpeg'),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerPlus(
                      padding: const EdgeInsets.only(top: 12, left: 10),
                      width: double.infinity,
                      height: 40,
                      radius: RadiusPlus.all(6),
                      color: Colors.deepPurple,
                      child: SizedBox(
                        child: TextPlus(
                          // 'Título do Video',
                          titleVideo,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  // ################### ANIMATION TRANSITION  ####################

  Route animationTransitionRoute(dynamic video) {

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  VideoMediaPlayer(videoId: video),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }



  displayDialog(BuildContext context, dynamic pageRoute) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
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
