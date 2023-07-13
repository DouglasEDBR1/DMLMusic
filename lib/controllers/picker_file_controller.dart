import 'dart:convert';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import '../models/music_playlist_model.dart';
import '../models/playlist_model.dart';
part 'picker_file_controller.g.dart';

class PickerFileController = _PickerFileController with _$PickerFileController;

abstract class _PickerFileController with Store {

  // @observable
  // PlaylistModelx playlist = PlaylistModelx();

  @observable
  bool isPlaylistScreen = false;

  @observable
  ObservableList<PlaylistModelx> listPlaylist = ObservableList<PlaylistModelx>();

  @observable
  ObservableList<MusicModel> musics = ObservableList<MusicModel>();

  @observable
  PlaylistModelx playlist = PlaylistModelx();

  @observable
  MusicModel musicModel = MusicModel();

  @observable
  dynamic fileToDisplay;

  @observable
  String? playlistName;

  @observable
  String? title;

  @observable
  String? fileMusicName;

  @observable
  String? bandTitle;

  @observable
  dynamic imagePlaylist;

  @observable
  dynamic imageAlbum;

  @observable
  dynamic musicPlay;

  @action
  setPlaylistName(String value) => playlistName = value;

  @action
  setMusicPlay(String value) =>  musicPlay = value;

  @action
  void setFileToDisplay(String value) => fileToDisplay = value;

  @action
  void setImageAlbum(dynamic value) => imageAlbum = value;

  @action
  void setImagePlaylist(dynamic value) => imagePlaylist = value;

  @action
  void setFileMusic(String value) => fileMusicName = value;

  @action
  void setBandTitle(String value) => bandTitle = value;

  setPlaylist(PlaylistModelx value) => playlist = value;

  @action
  init() {
    readFile().then((dados) {
      listPlaylist.clear();
      var list = json.decode(dados) as List;
      listPlaylist.addAll(list.map((e) => PlaylistModelx.map(e)).toList());
      // musics.addAll(list.map((e) => MusicModel.map(e.musics)).toList());
      print(listPlaylist);
    });
  }

  @action
  initPlaylist() {
    readFile().then((dados) {
      print(listPlaylist);
      listPlaylist.clear();
      print(listPlaylist);
      var list = json.decode(dados) as List;
      listPlaylist.addAll(list.map((e) => PlaylistModelx.map(e)).toList());
      print(listPlaylist);
    });
  }

  @action
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/musics.json" );
  }

  @action
  saveFilePlaylist() async {
    var arquivo = await _getFile();
    String dados = json.encode( listPlaylist );
    arquivo.writeAsString(dados);
  }

  @action
  saveFileMusic() async {
    var arquivo = await _getFile();
    print(listPlaylist);
    String dados = json.encode( listPlaylist );
    arquivo.writeAsString(dados);
  }

  @action
  readFile() async {
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

  @action
  musicDelete(MusicModel musicPlaylist) async {
    musics.removeWhere((element) => element == musicPlaylist);
    _reorderMusics();
    saveFileMusic();
    clearMusicData();
  }

  @action
  playlistDelete(PlaylistModelx playlist) async {
    this.listPlaylist.removeWhere((element) => element == playlist);
    _reorderMusics();
    saveFilePlaylist();
    clearMusicData();
  }

  @action
  undoDelete(int index, MusicModel musicPlaylist) async {
    musics.insert(index, musicPlaylist);
   _reorderMusics();
    saveFileMusic();
    clearMusicData();
  }

  _reorderMusics() {
    List<MusicModel> musicsAux = [];
    musicsAux.addAll(musics);
    musics.clear();
    musicsAux.map((e) {
      MusicModel newMusic = MusicModel();
      newMusic.id = musics.length + 1;
      newMusic.albumImage = e.albumImage;
      newMusic.music = e.music;
      newMusic.band = e.band;
      newMusic.musicPlay = e.musicPlay;
      musics.add(newMusic);
    }).toList();
  }

  @action
  savePlaylist(){

    PlaylistModelx newPlaylist = PlaylistModelx();

    newPlaylist.id = listPlaylist.length + 1;
    newPlaylist.playlistName = playlistName;
    newPlaylist.playlistImage = imagePlaylist;
    newPlaylist.musics = null;

    listPlaylist.add(newPlaylist);

    saveFilePlaylist();
    clearPlaylistData();
  }

  @action
  saveMusic(PlaylistModelx playlist){
    MusicModel newMusic = MusicModel();

    newMusic.id = playlist.musics!.length + 1;
    newMusic.music = fileMusicName;
    newMusic.band = bandTitle.toString();
    newMusic.musicPlay = fileToDisplay;
    newMusic.albumImage = imageAlbum;

    //musics.add(newMusic);
    this.listPlaylist.map((element) => element.id == playlist.id ? element.musics!.add(newMusic) : null).toList();
    print(this.listPlaylist);
    print(playlist);

    saveFileMusic();
    clearMusicData();
  }

  @action
  clearPlaylistData() {
    playlistName = null;
    imagePlaylist = null;
    clearMusicData();
  }

  @action
  clearMusicData() {
    title = '';
    bandTitle = '';
    imageAlbum = null;
    fileToDisplay = null;
    fileMusicName = null;
    title = 'Adicionar música';
  }

}