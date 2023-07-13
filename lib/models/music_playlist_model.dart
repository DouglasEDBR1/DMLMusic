class MusicModel{

  int? id;
  String? music;
  String? band;
  dynamic musicPlay;
  dynamic albumImage;

  MusicModel();

  MusicModel.map(Map<String, dynamic> json){
    id = json['musics']['id'];
    music = json['musics']['music'];
    band = json['musics']['band'];
    musicPlay = json['musics']['musicPlay'];
    albumImage = json['musics']['albumImage'];
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