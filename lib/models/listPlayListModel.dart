import 'package:dml_music/models/playlist_model.dart';

class ListPlaylistModel {

  int? id;
  List<PlaylistModelx> playlist = [];

  ListPlaylistModel();

  ListPlaylistModel.map(Map<String, dynamic> json) {
    if(json['playlist'] != null){
      var list = json['playlist'] as List;
      playlist = list.map((playlist) => PlaylistModelx.map(playlist)).toList();
    }
    else{
      playlist = [];
    }
  }
}