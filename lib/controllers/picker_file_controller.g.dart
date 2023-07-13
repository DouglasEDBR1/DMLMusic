// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picker_file_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PickerFileController on _PickerFileController, Store {
  late final _$isPlaylistScreenAtom =
      Atom(name: '_PickerFileController.isPlaylistScreen', context: context);

  @override
  bool get isPlaylistScreen {
    _$isPlaylistScreenAtom.reportRead();
    return super.isPlaylistScreen;
  }

  @override
  set isPlaylistScreen(bool value) {
    _$isPlaylistScreenAtom.reportWrite(value, super.isPlaylistScreen, () {
      super.isPlaylistScreen = value;
    });
  }

  late final _$listPlaylistAtom =
      Atom(name: '_PickerFileController.listPlaylist', context: context);

  @override
  ObservableList<PlaylistModelx> get listPlaylist {
    _$listPlaylistAtom.reportRead();
    return super.listPlaylist;
  }

  @override
  set listPlaylist(ObservableList<PlaylistModelx> value) {
    _$listPlaylistAtom.reportWrite(value, super.listPlaylist, () {
      super.listPlaylist = value;
    });
  }

  late final _$musicsAtom =
      Atom(name: '_PickerFileController.musics', context: context);

  @override
  ObservableList<MusicModel> get musics {
    _$musicsAtom.reportRead();
    return super.musics;
  }

  @override
  set musics(ObservableList<MusicModel> value) {
    _$musicsAtom.reportWrite(value, super.musics, () {
      super.musics = value;
    });
  }

  late final _$playlistAtom =
      Atom(name: '_PickerFileController.playlist', context: context);

  @override
  PlaylistModelx get playlist {
    _$playlistAtom.reportRead();
    return super.playlist;
  }

  @override
  set playlist(PlaylistModelx value) {
    _$playlistAtom.reportWrite(value, super.playlist, () {
      super.playlist = value;
    });
  }

  late final _$musicModelAtom =
      Atom(name: '_PickerFileController.musicModel', context: context);

  @override
  MusicModel get musicModel {
    _$musicModelAtom.reportRead();
    return super.musicModel;
  }

  @override
  set musicModel(MusicModel value) {
    _$musicModelAtom.reportWrite(value, super.musicModel, () {
      super.musicModel = value;
    });
  }

  late final _$fileToDisplayAtom =
      Atom(name: '_PickerFileController.fileToDisplay', context: context);

  @override
  dynamic get fileToDisplay {
    _$fileToDisplayAtom.reportRead();
    return super.fileToDisplay;
  }

  @override
  set fileToDisplay(dynamic value) {
    _$fileToDisplayAtom.reportWrite(value, super.fileToDisplay, () {
      super.fileToDisplay = value;
    });
  }

  late final _$playlistNameAtom =
      Atom(name: '_PickerFileController.playlistName', context: context);

  @override
  String? get playlistName {
    _$playlistNameAtom.reportRead();
    return super.playlistName;
  }

  @override
  set playlistName(String? value) {
    _$playlistNameAtom.reportWrite(value, super.playlistName, () {
      super.playlistName = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_PickerFileController.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$fileMusicNameAtom =
      Atom(name: '_PickerFileController.fileMusicName', context: context);

  @override
  String? get fileMusicName {
    _$fileMusicNameAtom.reportRead();
    return super.fileMusicName;
  }

  @override
  set fileMusicName(String? value) {
    _$fileMusicNameAtom.reportWrite(value, super.fileMusicName, () {
      super.fileMusicName = value;
    });
  }

  late final _$bandTitleAtom =
      Atom(name: '_PickerFileController.bandTitle', context: context);

  @override
  String? get bandTitle {
    _$bandTitleAtom.reportRead();
    return super.bandTitle;
  }

  @override
  set bandTitle(String? value) {
    _$bandTitleAtom.reportWrite(value, super.bandTitle, () {
      super.bandTitle = value;
    });
  }

  late final _$imagePlaylistAtom =
      Atom(name: '_PickerFileController.imagePlaylist', context: context);

  @override
  dynamic get imagePlaylist {
    _$imagePlaylistAtom.reportRead();
    return super.imagePlaylist;
  }

  @override
  set imagePlaylist(dynamic value) {
    _$imagePlaylistAtom.reportWrite(value, super.imagePlaylist, () {
      super.imagePlaylist = value;
    });
  }

  late final _$imageAlbumAtom =
      Atom(name: '_PickerFileController.imageAlbum', context: context);

  @override
  dynamic get imageAlbum {
    _$imageAlbumAtom.reportRead();
    return super.imageAlbum;
  }

  @override
  set imageAlbum(dynamic value) {
    _$imageAlbumAtom.reportWrite(value, super.imageAlbum, () {
      super.imageAlbum = value;
    });
  }

  late final _$musicPlayAtom =
      Atom(name: '_PickerFileController.musicPlay', context: context);

  @override
  dynamic get musicPlay {
    _$musicPlayAtom.reportRead();
    return super.musicPlay;
  }

  @override
  set musicPlay(dynamic value) {
    _$musicPlayAtom.reportWrite(value, super.musicPlay, () {
      super.musicPlay = value;
    });
  }

  late final _$_getFileAsyncAction =
      AsyncAction('_PickerFileController._getFile', context: context);

  @override
  Future<File> _getFile() {
    return _$_getFileAsyncAction.run(() => super._getFile());
  }

  late final _$saveFilePlaylistAsyncAction =
      AsyncAction('_PickerFileController.saveFilePlaylist', context: context);

  @override
  Future saveFilePlaylist() {
    return _$saveFilePlaylistAsyncAction.run(() => super.saveFilePlaylist());
  }

  late final _$saveFileMusicAsyncAction =
      AsyncAction('_PickerFileController.saveFileMusic', context: context);

  @override
  Future saveFileMusic() {
    return _$saveFileMusicAsyncAction.run(() => super.saveFileMusic());
  }

  late final _$readFileAsyncAction =
      AsyncAction('_PickerFileController.readFile', context: context);

  @override
  Future readFile() {
    return _$readFileAsyncAction.run(() => super.readFile());
  }

  late final _$musicDeleteAsyncAction =
      AsyncAction('_PickerFileController.musicDelete', context: context);

  @override
  Future musicDelete(MusicModel musicPlaylist) {
    return _$musicDeleteAsyncAction.run(() => super.musicDelete(musicPlaylist));
  }

  late final _$playlistDeleteAsyncAction =
      AsyncAction('_PickerFileController.playlistDelete', context: context);

  @override
  Future playlistDelete(PlaylistModelx playlist) {
    return _$playlistDeleteAsyncAction
        .run(() => super.playlistDelete(playlist));
  }

  late final _$undoDeleteAsyncAction =
      AsyncAction('_PickerFileController.undoDelete', context: context);

  @override
  Future undoDelete(int index, MusicModel musicPlaylist) {
    return _$undoDeleteAsyncAction
        .run(() => super.undoDelete(index, musicPlaylist));
  }

  late final _$_PickerFileControllerActionController =
      ActionController(name: '_PickerFileController', context: context);

  @override
  dynamic setPlaylistName(String value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setPlaylistName');
    try {
      return super.setPlaylistName(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMusicPlay(String value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setMusicPlay');
    try {
      return super.setMusicPlay(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFileToDisplay(String value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setFileToDisplay');
    try {
      return super.setFileToDisplay(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageAlbum(dynamic value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setImageAlbum');
    try {
      return super.setImageAlbum(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImagePlaylist(dynamic value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setImagePlaylist');
    try {
      return super.setImagePlaylist(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFileMusic(String value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setFileMusic');
    try {
      return super.setFileMusic(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBandTitle(String value) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.setBandTitle');
    try {
      return super.setBandTitle(value);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic init() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.init');
    try {
      return super.init();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initPlaylist() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.initPlaylist');
    try {
      return super.initPlaylist();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic savePlaylist() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.savePlaylist');
    try {
      return super.savePlaylist();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveMusic(PlaylistModelx playlist) {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.saveMusic');
    try {
      return super.saveMusic(playlist);
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearPlaylistData() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.clearPlaylistData');
    try {
      return super.clearPlaylistData();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearMusicData() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.clearMusicData');
    try {
      return super.clearMusicData();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaylistScreen: ${isPlaylistScreen},
listPlaylist: ${listPlaylist},
musics: ${musics},
playlist: ${playlist},
musicModel: ${musicModel},
fileToDisplay: ${fileToDisplay},
playlistName: ${playlistName},
title: ${title},
fileMusicName: ${fileMusicName},
bandTitle: ${bandTitle},
imagePlaylist: ${imagePlaylist},
imageAlbum: ${imageAlbum},
musicPlay: ${musicPlay}
    ''';
  }
}
