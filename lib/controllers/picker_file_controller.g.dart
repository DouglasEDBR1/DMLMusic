// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picker_file_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PickerFileController on _PickerFileController, Store {
  late final _$playlistModelAtom =
      Atom(name: '_PickerFileController.playlistModel', context: context);

  @override
  MusicPlaylistModel get playlistModel {
    _$playlistModelAtom.reportRead();
    return super.playlistModel;
  }

  @override
  set playlistModel(MusicPlaylistModel value) {
    _$playlistModelAtom.reportWrite(value, super.playlistModel, () {
      super.playlistModel = value;
    });
  }

  late final _$playlistAtom =
      Atom(name: '_PickerFileController.playlist', context: context);

  @override
  ObservableList<MusicPlaylistModel> get playlist {
    _$playlistAtom.reportRead();
    return super.playlist;
  }

  @override
  set playlist(ObservableList<MusicPlaylistModel> value) {
    _$playlistAtom.reportWrite(value, super.playlist, () {
      super.playlist = value;
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

  late final _$saveFileAsyncAction =
      AsyncAction('_PickerFileController.saveFile', context: context);

  @override
  Future saveFile() {
    return _$saveFileAsyncAction.run(() => super.saveFile());
  }

  late final _$readFileAsyncAction =
      AsyncAction('_PickerFileController.readFile', context: context);

  @override
  Future readFile() {
    return _$readFileAsyncAction.run(() => super.readFile());
  }

  late final _$deleteFileAsyncAction =
      AsyncAction('_PickerFileController.deleteFile', context: context);

  @override
  Future deleteFile(MusicPlaylistModel musicPlaylist) {
    return _$deleteFileAsyncAction.run(() => super.deleteFile(musicPlaylist));
  }

  late final _$undoDeleteAsyncAction =
      AsyncAction('_PickerFileController.undoDelete', context: context);

  @override
  Future undoDelete(int index, MusicPlaylistModel musicPlaylist) {
    return _$undoDeleteAsyncAction
        .run(() => super.undoDelete(index, musicPlaylist));
  }

  late final _$_PickerFileControllerActionController =
      ActionController(name: '_PickerFileController', context: context);

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
  dynamic saveMusic() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.saveMusic');
    try {
      return super.saveMusic();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic limparDados() {
    final _$actionInfo = _$_PickerFileControllerActionController.startAction(
        name: '_PickerFileController.limparDados');
    try {
      return super.limparDados();
    } finally {
      _$_PickerFileControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlistModel: ${playlistModel},
playlist: ${playlist},
fileToDisplay: ${fileToDisplay},
title: ${title},
fileMusicName: ${fileMusicName},
bandTitle: ${bandTitle},
imageAlbum: ${imageAlbum},
musicPlay: ${musicPlay}
    ''';
  }
}
