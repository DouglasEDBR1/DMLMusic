// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MediaPLayerController on _PlayerController, Store {
  Computed<String>? _$timeProgressComputed;

  @override
  String get timeProgress =>
      (_$timeProgressComputed ??= Computed<String>(() => super.timeProgress,
              name: '_PlayerController.timeProgress'))
          .value;
  Computed<String>? _$totalTimeComputed;

  @override
  String get totalTime =>
      (_$totalTimeComputed ??= Computed<String>(() => super.totalTime,
              name: '_PlayerController.totalTime'))
          .value;
  Computed<double>? _$progressDurationComputed;

  @override
  double get progressDuration => (_$progressDurationComputed ??=
          Computed<double>(() => super.progressDuration,
              name: '_PlayerController.progressDuration'))
      .value;
  Computed<dynamic>? _$musicTitleComputed;

  @override
  dynamic get musicTitle =>
      (_$musicTitleComputed ??= Computed<dynamic>(() => super.musicTitle,
              name: '_PlayerController.musicTitle'))
          .value;
  Computed<dynamic>? _$bandComputed;

  @override
  dynamic get band => (_$bandComputed ??=
          Computed<dynamic>(() => super.band, name: '_PlayerController.band'))
      .value;
  Computed<dynamic>? _$imageAlbumComputed;

  @override
  dynamic get imageAlbum =>
      (_$imageAlbumComputed ??= Computed<dynamic>(() => super.imageAlbum,
              name: '_PlayerController.imageAlbum'))
          .value;

  late final _$isPlaylistAtom =
      Atom(name: '_PlayerController.isPlaylist', context: context);

  @override
  bool get isPlaylist {
    _$isPlaylistAtom.reportRead();
    return super.isPlaylist;
  }

  @override
  set isPlaylist(bool value) {
    _$isPlaylistAtom.reportWrite(value, super.isPlaylist, () {
      super.isPlaylist = value;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_PlayerController.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$audioDurationAtom =
      Atom(name: '_PlayerController.audioDuration', context: context);

  @override
  Duration get audioDuration {
    _$audioDurationAtom.reportRead();
    return super.audioDuration;
  }

  @override
  set audioDuration(Duration value) {
    _$audioDurationAtom.reportWrite(value, super.audioDuration, () {
      super.audioDuration = value;
    });
  }

  late final _$timeToMusicAtom =
      Atom(name: '_PlayerController.timeToMusic', context: context);

  @override
  Duration get timeToMusic {
    _$timeToMusicAtom.reportRead();
    return super.timeToMusic;
  }

  @override
  set timeToMusic(Duration value) {
    _$timeToMusicAtom.reportWrite(value, super.timeToMusic, () {
      super.timeToMusic = value;
    });
  }

  late final _$musicLengthAtom =
      Atom(name: '_PlayerController.musicLength', context: context);

  @override
  Duration get musicLength {
    _$musicLengthAtom.reportRead();
    return super.musicLength;
  }

  @override
  set musicLength(Duration value) {
    _$musicLengthAtom.reportWrite(value, super.musicLength, () {
      super.musicLength = value;
    });
  }

  late final _$musicProgressAtom =
      Atom(name: '_PlayerController.musicProgress', context: context);

  @override
  Duration get musicProgress {
    _$musicProgressAtom.reportRead();
    return super.musicProgress;
  }

  @override
  set musicProgress(Duration value) {
    _$musicProgressAtom.reportWrite(value, super.musicProgress, () {
      super.musicProgress = value;
    });
  }

  late final _$playingAtom =
      Atom(name: '_PlayerController.playing', context: context);

  @override
  bool get playing {
    _$playingAtom.reportRead();
    return super.playing;
  }

  @override
  set playing(bool value) {
    _$playingAtom.reportWrite(value, super.playing, () {
      super.playing = value;
    });
  }

  late final _$audioNameAtom =
      Atom(name: '_PlayerController.audioName', context: context);

  @override
  String? get audioName {
    _$audioNameAtom.reportRead();
    return super.audioName;
  }

  @override
  set audioName(String? value) {
    _$audioNameAtom.reportWrite(value, super.audioName, () {
      super.audioName = value;
    });
  }

  late final _$musicAtom =
      Atom(name: '_PlayerController.music', context: context);

  @override
  String? get music {
    _$musicAtom.reportRead();
    return super.music;
  }

  @override
  set music(String? value) {
    _$musicAtom.reportWrite(value, super.music, () {
      super.music = value;
    });
  }

  late final _$albumTitleAtom =
      Atom(name: '_PlayerController.albumTitle', context: context);

  @override
  String? get albumTitle {
    _$albumTitleAtom.reportRead();
    return super.albumTitle;
  }

  @override
  set albumTitle(String? value) {
    _$albumTitleAtom.reportWrite(value, super.albumTitle, () {
      super.albumTitle = value;
    });
  }

  late final _$imageAlbumTitleAtom =
      Atom(name: '_PlayerController.imageAlbumTitle', context: context);

  @override
  String? get imageAlbumTitle {
    _$imageAlbumTitleAtom.reportRead();
    return super.imageAlbumTitle;
  }

  @override
  set imageAlbumTitle(String? value) {
    _$imageAlbumTitleAtom.reportWrite(value, super.imageAlbumTitle, () {
      super.imageAlbumTitle = value;
    });
  }

  late final _$bandTitleAtom =
      Atom(name: '_PlayerController.bandTitle', context: context);

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

  late final _$musicPlayAtom =
      Atom(name: '_PlayerController.musicPlay', context: context);

  @override
  String? get musicPlay {
    _$musicPlayAtom.reportRead();
    return super.musicPlay;
  }

  @override
  set musicPlay(String? value) {
    _$musicPlayAtom.reportWrite(value, super.musicPlay, () {
      super.musicPlay = value;
    });
  }

  late final _$playerStateAtom =
      Atom(name: '_PlayerController.playerState', context: context);

  @override
  PlayerState? get playerState {
    _$playerStateAtom.reportRead();
    return super.playerState;
  }

  @override
  set playerState(PlayerState? value) {
    _$playerStateAtom.reportWrite(value, super.playerState, () {
      super.playerState = value;
    });
  }

  late final _$audioPlayerAtom =
      Atom(name: '_PlayerController.audioPlayer', context: context);

  @override
  AudioPlayer? get audioPlayer {
    _$audioPlayerAtom.reportRead();
    return super.audioPlayer;
  }

  @override
  set audioPlayer(AudioPlayer? value) {
    _$audioPlayerAtom.reportWrite(value, super.audioPlayer, () {
      super.audioPlayer = value;
    });
  }

  late final _$audioCacheAtom =
      Atom(name: '_PlayerController.audioCache', context: context);

  @override
  AudioCache? get audioCache {
    _$audioCacheAtom.reportRead();
    return super.audioCache;
  }

  @override
  set audioCache(AudioCache? value) {
    _$audioCacheAtom.reportWrite(value, super.audioCache, () {
      super.audioCache = value;
    });
  }

  late final _$idAtom = Atom(name: '_PlayerController.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$playlistAtom =
      Atom(name: '_PlayerController.playlist', context: context);

  @override
  List<MusicList>? get playlist {
    _$playlistAtom.reportRead();
    return super.playlist;
  }

  @override
  set playlist(List<MusicList>? value) {
    _$playlistAtom.reportWrite(value, super.playlist, () {
      super.playlist = value;
    });
  }

  late final _$myPlaylistAtom =
      Atom(name: '_PlayerController.myPlaylist', context: context);

  @override
  String? get myPlaylist {
    _$myPlaylistAtom.reportRead();
    return super.myPlaylist;
  }

  @override
  set myPlaylist(String? value) {
    _$myPlaylistAtom.reportWrite(value, super.myPlaylist, () {
      super.myPlaylist = value;
    });
  }

  late final _$musicNameAtom =
      Atom(name: '_PlayerController.musicName', context: context);

  @override
  dynamic get musicName {
    _$musicNameAtom.reportRead();
    return super.musicName;
  }

  @override
  set musicName(dynamic value) {
    _$musicNameAtom.reportWrite(value, super.musicName, () {
      super.musicName = value;
    });
  }

  late final _$bandNameAtom =
      Atom(name: '_PlayerController.bandName', context: context);

  @override
  dynamic get bandName {
    _$bandNameAtom.reportRead();
    return super.bandName;
  }

  @override
  set bandName(dynamic value) {
    _$bandNameAtom.reportWrite(value, super.bandName, () {
      super.bandName = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_PlayerController.image', context: context);

  @override
  dynamic get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(dynamic value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$predominantColorAtom =
      Atom(name: '_PlayerController.predominantColor', context: context);

  @override
  Future<PaletteGenerator>? get predominantColor {
    _$predominantColorAtom.reportRead();
    return super.predominantColor;
  }

  @override
  set predominantColor(Future<PaletteGenerator>? value) {
    _$predominantColorAtom.reportWrite(value, super.predominantColor, () {
      super.predominantColor = value;
    });
  }

  late final _$setMusicPlaylistAsyncAction =
      AsyncAction('_PlayerController.setMusicPlaylist', context: context);

  @override
  Future<dynamic> setMusicPlaylist(dynamic _result) {
    return _$setMusicPlaylistAsyncAction
        .run(() => super.setMusicPlaylist(_result));
  }

  late final _$playAsyncAction =
      AsyncAction('_PlayerController.play', context: context);

  @override
  Future play() {
    return _$playAsyncAction.run(() => super.play());
  }

  late final _$resumeAsyncAction =
      AsyncAction('_PlayerController.resume', context: context);

  @override
  Future resume() {
    return _$resumeAsyncAction.run(() => super.resume());
  }

  late final _$pauseAsyncAction =
      AsyncAction('_PlayerController.pause', context: context);

  @override
  Future pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  late final _$stopAsyncAction =
      AsyncAction('_PlayerController.stop', context: context);

  @override
  Future stop() {
    return _$stopAsyncAction.run(() => super.stop());
  }

  late final _$releaseAsyncAction =
      AsyncAction('_PlayerController.release', context: context);

  @override
  Future release() {
    return _$releaseAsyncAction.run(() => super.release());
  }

  late final _$seekAsyncAction =
      AsyncAction('_PlayerController.seek', context: context);

  @override
  Future seek() {
    return _$seekAsyncAction.run(() => super.seek());
  }

  late final _$nextAsyncAction =
      AsyncAction('_PlayerController.next', context: context);

  @override
  Future next() {
    return _$nextAsyncAction.run(() => super.next());
  }

  late final _$previousAsyncAction =
      AsyncAction('_PlayerController.previous', context: context);

  @override
  Future previous() {
    return _$previousAsyncAction.run(() => super.previous());
  }

  late final _$_PlayerControllerActionController =
      ActionController(name: '_PlayerController', context: context);

  @override
  dynamic seekToSec(int sec) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.seekToSec');
    try {
      return super.seekToSec(sec);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlaylist(dynamic value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setPlaylist');
    try {
      return super.setPlaylist(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setId');
    try {
      return super.setId(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPlayedComplete() {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.onPlayedComplete');
    try {
      return super.onPlayedComplete();
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMyPlaylist(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setMyPlaylist');
    try {
      return super.setMyPlaylist(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAlbumTitle(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setAlbumTitle');
    try {
      return super.setAlbumTitle(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageAlbumTitle(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setImageAlbumTitle');
    try {
      return super.setImageAlbumTitle(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBandTitle(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setBandTitle');
    try {
      return super.setBandTitle(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMusicPlay(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setMusicPlay');
    try {
      return super.setMusicPlay(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAudioName(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setAudioName');
    try {
      return super.setAudioName(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAudioCache(AudioCache value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setAudioCache');
    try {
      return super.setAudioCache(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAudioPlayer(AudioPlayer value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setAudioPlayer');
    try {
      return super.setAudioPlayer(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMusic(String value) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setMusic');
    try {
      return super.setMusic(value);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkPlaylist(bool _isPlaylist) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.checkPlaylist');
    try {
      return super.checkPlaylist(_isPlaylist);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMyPlaylistImage(String pathImage) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.setMyPlaylistImage');
    try {
      return super.setMyPlaylistImage(pathImage);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic wipeData() {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.wipeData');
    try {
      return super.wipeData();
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getIsVisibleNavBar(bool _isVisible) {
    final _$actionInfo = _$_PlayerControllerActionController.startAction(
        name: '_PlayerController.getIsVisibleNavBar');
    try {
      return super.getIsVisibleNavBar(_isVisible);
    } finally {
      _$_PlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaylist: ${isPlaylist},
isVisible: ${isVisible},
audioDuration: ${audioDuration},
timeToMusic: ${timeToMusic},
musicLength: ${musicLength},
musicProgress: ${musicProgress},
playing: ${playing},
audioName: ${audioName},
music: ${music},
albumTitle: ${albumTitle},
imageAlbumTitle: ${imageAlbumTitle},
bandTitle: ${bandTitle},
musicPlay: ${musicPlay},
playerState: ${playerState},
audioPlayer: ${audioPlayer},
audioCache: ${audioCache},
id: ${id},
playlist: ${playlist},
myPlaylist: ${myPlaylist},
musicName: ${musicName},
bandName: ${bandName},
image: ${image},
predominantColor: ${predominantColor},
timeProgress: ${timeProgress},
totalTime: ${totalTime},
progressDuration: ${progressDuration},
musicTitle: ${musicTitle},
band: ${band},
imageAlbum: ${imageAlbum}
    ''';
  }
}
