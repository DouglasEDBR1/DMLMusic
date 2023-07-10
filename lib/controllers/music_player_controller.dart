import 'package:audioplayers/audioplayers.dart';
import 'package:dml_music/models/music_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
import 'package:palette_generator/palette_generator.dart';

import '../utils/media_player_util.dart';
part 'music_player_controller.g.dart';


class MediaPLayerController = _PlayerController with _$MediaPLayerController;

abstract class _PlayerController with Store {

   @observable
   bool isPlaylist = false;
   String? myPlaylistImage;

   //SCROLL

   @observable
   bool isVisible = true;

   // ##########      OBSERVABLE  TIME PROGRESS       ##############

   @observable
   var audioDuration = const Duration();

   @observable
   var timeToMusic = const Duration();

   @observable
   var musicLength = const Duration();

   @observable
   var musicProgress = const Duration();

   @observable
   bool playing = false;


   // ##############     BUTTON STATE      ################

   IconData btn = Icons.play_arrow;


   // ###############    OBSERVABLE TITLE | ALBUM | MUSIC    ################

   @observable
   String? audioName = '';

   @observable
   String? music = '';

   @observable
   String? albumTitle = '';

   @observable
   String? imageAlbumTitle = '';

   @observable
   String? bandTitle = '';

   @observable
   String? musicPlay = '';


   // #################   OBSERVABLE AUDIO PLAYER  ###################

   @observable
   PlayerState? playerState;

   @observable
   AudioPlayer? audioPlayer = AudioPlayer();

   @observable
   AudioCache? audioCache = AudioCache();


   //  ################  ACTION  TIME PROGRESS      ######################

   @action
   seekToSec(int sec) {
      Duration newPos = Duration(seconds: sec);
      audioPlayer?.seek(newPos);
   }

   @computed
   String get timeProgress => audioDuration != null ? (audioDuration.inMinutes).toString() + ":" + (audioDuration.inSeconds - (audioDuration.inMinutes * 60)).toString().padLeft(2, "0") : '0:00';

   @computed
   String get totalTime => timeToMusic != null ? (timeToMusic.inMinutes).toString() + ":" + (timeToMusic.inSeconds - (timeToMusic.inMinutes * 60)).toString().padLeft(2, "0") : '0:00';

   @computed
   double get progressDuration => audioDuration != null ? (audioDuration.inSeconds > 0 ? timeToMusic.inSeconds.toDouble() * 1 / audioDuration.inSeconds : 0) : 0;


   // ###############     MY PLAYLIST     ##################

   @observable
   int? id = 0;

   @observable
   List<MusicList>? playlist;


   // ###############      ACTION CONTROL MEDIA PLAYER       ##################

   @action
   setPlaylist(dynamic value) => playlist = value;

   @action
   setId(int value) => id = value;

   @action
   onPlayedComplete(){
      audioPlayer?.onPlayerCompletion.listen((event) {
         playing = false;
         musicPlay != '' ? next() : stop();
         //playerState = PlayerState.COMPLETED;
         btn = Icons.play_arrow;
      });
   }

   @action
   Future setMusicPlaylist(var _result) async {
      audioPlayer?.setReleaseMode(ReleaseMode.LOOP);
      if(_result != null){
         audioPlayer?.play(_result,);
         musicPlay = '';
      }else{
         print('Erro ao carregar música');
      }
      resume();
   }

   @action
   play() async {
      audioPlayer = await audioCache?.play(playlist![id!].musicPlay!);
      AudioCache(fixedPlayer: audioPlayer);
      btn = Icons.pause;
      playing = true;
   }

   @action
   resume() async {
      await audioPlayer?.resume();
      btn = Icons.pause;
      musicPlay != null ? playing = true : playing = false;
   }

   @action
   pause() async {
      await audioPlayer?.pause();
     // playerState = PlayerState.PAUSED;
      btn = Icons.play_arrow;
      playing = false;
   }

   @action
   stop() async {
      await audioPlayer?.stop();
      playerState = PlayerState.STOPPED;
      btn = Icons.play_arrow;
      playing = false;
   }

   @action
   release() async {
      await audioPlayer?.release();
      btn = Icons.play_arrow;
      playing = false;
   }

   @action
   seek() async{
      await audioPlayer?.seek(const Duration(milliseconds: 1200));
   }

   @action
   next() async{
      if (id! >= playlist!.length-1){
         null;
      } else{
         id = id!+1;
         await colorBackground;
         await play();
      }

   }

   @action
   previous() async{
      if (id! == 0){
         play();
      } else{
         id = id!-1;
         await colorBackground;
         await play();
      }

   }


   // ################         MY PLAYLIST        ####################

   @observable
   String? myPlaylist;

   @action
   void setMyPlaylist(String value) => myPlaylist = value;


   // ########    OBSERVABLE AND ACTION  ALBUM  | MUSIC | BAND    ########

   @observable
   dynamic musicName;

   @computed
   dynamic get musicTitle => musicName = playlist![id!].music;

   @observable
   dynamic bandName;

   @computed
   dynamic get band => bandName = playlist![id!].band;

   @observable
   dynamic image;

   @computed
   dynamic get imageAlbum => image = playlist![id!].albumImage;


  // ##############      ACTION ALBUM      ##############

   @action
   void setAlbumTitle(String value) => albumTitle = value;

   @action
   void setImageAlbumTitle(String value) => imageAlbumTitle = value;

   @action
   void setBandTitle(String value) => bandTitle = value;

   @action
   void setMusicPlay(String value) => musicPlay = value;

   @action
   void setAudioName(String value) => audioName = value;

   @action
   void setAudioCache(AudioCache value) => audioCache = value;

   @action
   void setAudioPlayer(AudioPlayer value) => audioPlayer = value;

   @action
   void setMusic(String value) => music = value;

   //

   @action
   checkPlaylist(bool _isPlaylist) {
      isPlaylist = _isPlaylist;
   }

   @action
   setMyPlaylistImage(String pathImage) {
      myPlaylistImage = pathImage;
   }


   // ##########      PALETTE COLOR BACKGROUND      ###########

   @observable
   Future<PaletteGenerator>? predominantColor;

   Future<PaletteGenerator>? get colorBackground => predominantColor = updatePaletteGenerator();

   Future<PaletteGenerator> updatePaletteGenerator() async {
    PaletteGenerator paletteGenerator = await PaletteGenerator
        .fromImageProvider(imageAlbumTitle != '' && !isPlaylist
            ? Image.asset("assets/images/${playlist![id!].albumImage}").image
            : myPlaylistImage != '' && myPlaylistImage != null && isPlaylist
                ? Image.file(
                    MediaPlayerUtil.imageFile('$myPlaylistImage'),
                    cacheHeight: 200,
                    cacheWidth: 200,
                  ).image
                : Image.asset("assets/images/wave_form3.gif").image);
    return paletteGenerator;
  }

  @action
   wipeData() {
      stop();
      myPlaylistImage = '';
      setImageAlbumTitle('');
      setBandTitle('');
      setAlbumTitle('');
      setMusic('');
      setMyPlaylist('');
      setMusicPlaylist('');
      predominantColor = updatePaletteGenerator();
   }

   @action
   getIsVisibleNavBar(bool _isVisible) {
      isVisible = _isVisible;
      print(isVisible);
   }

}