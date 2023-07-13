import 'package:dml_music/models/music_playlist_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistModelx{

  int? id;
  String? playlistName;
  String? playlistImage;
  List<MusicModel>? musics;

  PlaylistModelx();

  PlaylistModelx.map(Map<String, dynamic> json) {
    id = json['id'];
    playlistName = json['playlistName'];
    playlistImage = json['playlistImage'];
    //musics = json['musics'];
    if(json['musics'] != null){
      var list = json['musics'] as List;
      // musics = list.map((music) => MusicModel.map(music)).toList();
      this.musics = list.map((music) => MusicModel.map(music)).toList();

      print(this.musics);
    }
    else{
      musics = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['playlistName'] = playlistName;
    data['playlistImage'] = playlistImage;
    if (musics != null && musics!.length > 0) {
      data['musics'] = musics?.map((e) {
        return {
          'musics': e,
        };
      }).toList();
    }
    // data['musics'] = musics;

    return data;
  }

}