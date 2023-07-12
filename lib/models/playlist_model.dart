import 'package:dml_music/models/music_playlist_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistModel{
  int? id;
  String? playlistName;
  List<MusicPlaylistModel> musics = [];

  PlaylistModel();

  PlaylistModel.map(Map<String, dynamic> json) {
    id = json['id'];
    playlistName = json['playlistName'];
    if(json['listPlaylist'] != null){
      var list = json['listPlaylist'] as List;
      musics = list.map((playlist) => MusicPlaylistModel.map(playlist)).toList();
    }
    else{
      musics = [];
    }
  }

}