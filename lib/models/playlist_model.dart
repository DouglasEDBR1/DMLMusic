class MusicPlaylistModel{

  int? id;
  String? music;
  String? band;
  dynamic musicPlay;
  dynamic albumImage;

  MusicPlaylistModel();

  MusicPlaylistModel.map(Map<String, dynamic> json){
    id = json['id'];
    music = json['music'];
    band = json['band'];
    musicPlay = json['musicPlay'];
    albumImage = json['albumImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['music'] = music;
    data['band'] = band;
    data['musicPlay'] = musicPlay;
    data['albumImage'] = albumImage;

    return data;
  }

}