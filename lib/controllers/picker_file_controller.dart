import 'dart:convert';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import '../models/playlist_model.dart';
part 'picker_file_controller.g.dart';

class PickerFileController = _PickerFileController with _$PickerFileController;

abstract class _PickerFileController with Store {

  @observable
  MusicPlaylistModel playlistModel = MusicPlaylistModel();

  @observable
  ObservableList<MusicPlaylistModel> playlist = ObservableList<MusicPlaylistModel>();

  @observable
  dynamic fileToDisplay;

  @observable
  String? title;

  @observable
  String? fileMusicName;

  @observable
  String? bandTitle;

  @observable
  dynamic imageAlbum;

  @observable
  dynamic musicPlay;

  @action
  setMusicPlay(String value) =>  musicPlay = value;

  @action
  void setFileToDisplay(String value) => fileToDisplay = value;

  @action
  void setImageAlbum(dynamic value) => imageAlbum = value;

  @action
  void setFileMusic(String value) => fileMusicName = value;

  @action
  void setBandTitle(String value) => bandTitle = value;

  @action
  init() {
    readFile().then((dados) {
      playlist.clear();
      var list = json.decode(dados) as List;
      playlist.addAll(list.map((e) => MusicPlaylistModel.map(e)).toList());
    });
  }

  @action
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/musics.json" );
  }

  @action
  saveFile() async {
    var arquivo = await _getFile();
    String dados = json.encode( playlist );
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
  deleteFile(MusicPlaylistModel musicPlaylist) async {
    playlist.removeWhere((element) => element == musicPlaylist);
    _reorderPlaylist();
    saveFile();
    limparDados();
  }

  @action
  undoDelete(int index, MusicPlaylistModel musicPlaylist) async {
    playlist.insert(index, musicPlaylist);
   _reorderPlaylist();
    saveFile();
    limparDados();
  }

  _reorderPlaylist() {
    List<MusicPlaylistModel> playlistAux = [];
    playlistAux.addAll(playlist);
    playlist.clear();
    playlistAux.map((e) {
      MusicPlaylistModel novaPlaylist = MusicPlaylistModel();
      novaPlaylist.id = playlist.length + 1;
      novaPlaylist.albumImage = e.albumImage;
      novaPlaylist.music = e.music;
      novaPlaylist.band = e.band;
      novaPlaylist.musicPlay = e.musicPlay;
      playlist.add(novaPlaylist);
    }).toList();
  }

  @action
  saveMusic(){
    MusicPlaylistModel novaPlaylist = MusicPlaylistModel();
    novaPlaylist.id = playlist.length + 1;
    novaPlaylist.music = fileMusicName;
    novaPlaylist.band = bandTitle.toString();
    novaPlaylist.musicPlay = fileToDisplay;
    novaPlaylist.albumImage = imageAlbum;

    playlist.add(novaPlaylist);

    saveFile();
    limparDados();
  }

  @action
  limparDados() {
    title = '';
    bandTitle = '';
    imageAlbum = null;
    fileToDisplay = null;
    fileMusicName = null;
    title = 'Adicionar música';
  }

}