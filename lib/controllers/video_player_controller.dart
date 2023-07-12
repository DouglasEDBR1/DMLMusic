import 'dart:convert';
import 'package:dml_music/api/api_video.dart';
import 'package:mobx/mobx.dart';
import '../models/video_model.dart';

part 'video_player_controller.g.dart';

class VideoPlayerController = _VideoPlayerController with _$VideoPlayerController;

abstract class _VideoPlayerController with Store {

  ObservableList<VideoModel> videoList = ObservableList<VideoModel>();

  VideoModel video = VideoModel();

  final youtubeKeyApi = 'AIzaSyAbF23f66Gp6afubOM_FgpZulbm_dkHOOk';
  final apiVideo = VideoApi();

  @observable
  int maxResult = 20;

  @observable
  String? search;

  // setSearchVideoResult(String search) {
  //   this.search = search;
  //   // if(search != '' && search != null) {
  //   //   getVideo();
  //   // }
  // }

  init() {
    getVideo();
  }

  Future getVideo() async {
    videoList.clear();
    await apiVideo.getVideo(
        search: search,
        maxResult: maxResult,
        keyYoutubeApi: youtubeKeyApi,
    ).then((response) {
      if (response.statusCode == 200){
        var list = json.decode(response.body);
        videoList.addAll(list['items'].map<VideoModel>((e) => VideoModel.fromJson(e)).toList());
      }
    }).catchError((e) {
      print(e);
    }).whenComplete(() => null);
  }
}