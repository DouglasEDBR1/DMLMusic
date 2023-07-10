class MusicList{

  int id;
  String? band;
  String? album;
  String? music;
  String? albumImage;
  String? musicPlay;

  MusicList({required this.id, this.album, this.band, this.music, this.albumImage, this.musicPlay,});

  factory MusicList.fromJson(Map<String, dynamic> map){
    return MusicList(
      id: map['musicId'],
      album: map['album'],
      band: map['band'],
      music: map['music'],
      albumImage: map['albumImage'],
      musicPlay: map['musicPlay'],
    );
  }


}