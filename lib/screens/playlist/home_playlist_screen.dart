import 'package:dml_music/screens/playlist/playlist_screen.dart';
import 'package:dml_music/utils/media_player_util.dart';
import 'package:dml_music/widget/background_layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import '../../controllers/music_player_controller.dart';
import '../../controllers/picker_file_controller.dart';
import '../../models/music_playlist_model.dart';
import '../../models/playlist_model.dart';
import 'methods/icon_animated.dart';

import 'dart:io';

class HomePlaylistScreen extends StatefulWidget {
  const HomePlaylistScreen({Key? key}) : super(key: key);

  @override
  State<HomePlaylistScreen> createState() => _HomePlaylistScreenState();
}

class _HomePlaylistScreenState extends State<HomePlaylistScreen> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();
  final pickerFileController = GetIt.I<PickerFileController>();

  //    PICKER FILE
  FilePickerResult? imageResult, musicResult;
  String? labelMusicName = 'Adicionar música', labelImageName = 'Adicionar imagem', _titlePlaylist = '';
  PlatformFile? pickedFileMusic, pickedFileImage;
  bool isLoadingImage = false, isLoadingMusic = false, iconAnimatedController = false, isDialog = false, isPlaylistScreen = false;
  File? fileToDisplayMusic, fileToDisplayImage;
  //

  final _playlistName = TextEditingController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    pickerFileController.initPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _floatingActionButton(),
    );
  }

  _buildBody() {

    return Observer(builder: (_) {
      return ContainerPlus(
        child: Stack(
          children: [
            const BackgroundLayout(),
            ContainerPlus(
              padding: const EdgeInsets.only(top: 82, left: 16, right: 9),
              height: 140,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          // Navigator.of(context).pop();
                          setState((){
                            isPlaylistScreen = false;
                          });
                        },
                        child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                      ),
                      TextPlus(
                        !isPlaylistScreen ? 'Minhas Playlist\'s' : _titlePlaylist,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
                left: 300,
                top: 12,
                child: IconAnimatedUtils(size: 60,)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: ContainerPlus(
                child: Column(
                  children: [
                    !isPlaylistScreen
                        ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(4),
                          shrinkWrap: true,
                          addRepaintBoundaries: true,
                          addAutomaticKeepAlives: true,
                          itemCount: pickerFileController.listPlaylist.length,
                          itemBuilder: (_, index) {
                            var playlist = pickerFileController.listPlaylist.elementAt(index);
                            pickerFileController.setPlaylist(playlist);
                            return _getPlaylistList(context, index, playlist);
                          }
                    ) : _getMusicList(context, playlist: pickerFileController.listPlaylist.elementAt(_index))
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: isDialog && !isPlaylistScreen
                    ? _dialogCustomPlaylist(context)
                    : isDialog && isPlaylistScreen
                    ? _dialogCustomMusic(context)
                    : Container(),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _getMusicList(context, {PlaylistModelx? playlist}) {
    return playlist!.musics!.isNotEmpty
        ? ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4),
        shrinkWrap: true,
        addRepaintBoundaries: true,
        addAutomaticKeepAlives: true,
        itemCount: playlist.musics?.length,
        itemBuilder:  (_, index) {
          print(index);
          var playList = playlist.musics?.elementAt(index);
          return _createMusicList(context, index, playList!);
        }
    ) : ContainerPlus(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        child: TextPlus('Nenhuma música encontrada!', fontSize: 20, color: Colors.white));
      }

  Widget _createMusicList(context, index, MusicModel musicPlaylist){

    return Dismissible(
      key: Key( DateTime.now().millisecondsSinceEpoch.toString() ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        //Remove item da lista
        pickerFileController.musicDelete(musicPlaylist);

        final snackbar = SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text("Música removida de sua playlist!"),
          action: SnackBarAction(
              textColor: Colors.white,
              label: "Recuperar",
              onPressed: (){
                //Insere novamente item removido na lista
                pickerFileController.undoDelete(index, musicPlaylist);
              }
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      background: ContainerPlus(
        color: Colors.deepPurple.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 36,
            )
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            _cardMusic(musicPlaylist),
          ],
        ),
      ),
    );
  }

  Widget _getPlaylistList(context, index, PlaylistModelx playlist){

    return Dismissible(
      key: Key( DateTime.now().millisecondsSinceEpoch.toString() ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        //Remove item da lista
        pickerFileController.playlistDelete(playlist);

        const snackbar = SnackBar(
          duration: Duration(seconds: 5),
          content: Text("Playlist demovida com sucesso!"),
          // action: SnackBarAction(
          //     textColor: Colors.white,
          //     label: "Recuperar",
          //     onPressed: (){
          //       //Insere novamente item removido na lista
          //       pickerFileController.undoDelete(index, playlist);
          //     }
          // ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      background: ContainerPlus(
        color: Colors.deepPurple.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 36,
            )
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            _cardPlaylist(playlist),
          ],
        ),
      ),
    );
  }

  Widget _cardMusic(MusicModel musicPlaylist){

    return ContainerPlus(
      color: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.only(left: 6, top: 2, bottom: 2),
      child: Column(
        children: [
          Observer(
            builder: (_) => InkWell(
              onTap: (){
                mediaPlayerController.wipeData();
                mediaPlayerController.checkPlaylist(true);
                mediaPlayerController.setMyPlaylist(musicPlaylist.music!);
                mediaPlayerController.setMusicPlaylist(musicPlaylist.musicPlay);
                if (musicPlaylist.albumImage != null) {
                  mediaPlayerController.setMyPlaylistImage(musicPlaylist.albumImage);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextPlus(musicPlaylist.id.toString(), color: Colors.white, margin: const EdgeInsets.only(right: 16)),
                      ContainerPlus(
                          radius: RadiusPlus.all(16),
                          width: 54,
                          height: 54,
                          child: musicPlaylist.albumImage != null
                              ? Image.file(
                            MediaPlayerUtil.imageFile(musicPlaylist.albumImage),
                            cacheWidth: 200,
                            cacheHeight: 200,
                          )
                              : ContainerPlus(
                            color: Colors.purple,
                            gradient: GradientPlus.linear(
                              colors: [
                                Colors.purpleAccent,
                                Colors.purple,
                                Colors.deepPurple,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                            ),
                            child: const Icon(
                              Icons.my_library_music,
                              color: Colors.white,
                              size: 44,
                            ),
                          )
                      ),
                      const SizedBox(width: 14,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 260,
                            child: TextPlus(
                              musicPlaylist.music,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardPlaylist(PlaylistModelx playlist){

    return ContainerPlus(
      color: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.only(left: 6, top: 2, bottom: 2),
      child: Column(
        children: [
          Observer(
            builder: (_) => InkWell(
              onTap: (){
                setState((){
                  _index = playlist.id! -1;
                  pickerFileController.setPlaylist(playlist);
                  _titlePlaylist = playlist.playlistName;
                  isPlaylistScreen = true;
                });
                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PlaylistLocalScreen(playlist: playlist)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextPlus(playlist.id.toString(), color: Colors.white, margin: const EdgeInsets.only(right: 16)),
                      ContainerPlus(
                          radius: RadiusPlus.all(16),
                          width: 54,
                          height: 54,
                          child: playlist.playlistImage != null
                              ? Image.file(
                            MediaPlayerUtil.imageFile(playlist.playlistImage!),
                            cacheWidth: 200,
                            cacheHeight: 200,
                          )
                              : ContainerPlus(
                            color: Colors.purple,
                            gradient: GradientPlus.linear(
                              colors: [
                                Colors.purpleAccent,
                                Colors.purple,
                                Colors.deepPurple,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                            ),
                            child: const Icon(
                              Icons.my_library_music,
                              color: Colors.white,
                              size: 44,
                            ),
                          )
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 260,
                            child: TextPlus(
                              playlist.playlistName,
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dialogCustomPlaylist(BuildContext context) {
    return Observer(builder: (_) => ContainerPlus(
      child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerPlus(
                padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 34),
                radius: RadiusPlus.all(20),
                color: Colors.black.withOpacity(0.96),
                child: ContainerPlus(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextPlus(
                        isPlaylistScreen ? 'Criando a sua playlist'  : "Montando a sua playlist",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      //  const SizedBox(height: 44),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextPlus('Nome da playlist', color: Colors.white, margin: const EdgeInsets.only(bottom: 4)),
                          TextFieldPlus(
                            controller: _playlistName,
                            cursorColor: Colors.purple,
                            height: 46,
                            textColor: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            radius: RadiusPlus.all(12),
                            border: BorderPlus(width: 1, color: Colors.purple),
                            placeholder: TextPlus(
                              'Digite aqui',
                              color: Colors.white70,
                            ),
                            backgroundColor: Colors.black12,
                            // gradient: GradientPlus.linear(
                            //   colors: [
                            //     Colors.black12,
                            //     Colors.black12,
                            //     Colors.purple,
                            //   ],
                            // ),
                          ),
                          const SizedBox(height: 20),
                          _addPickFile(labelImageName.toString(), pickFileImage)
                        ],
                      ),
                      //  const SizedBox(height: 40),
                      Column(
                        children: [
                          ContainerPlus(
                              onTap: () {
                                if (_playlistName.text.isNotEmpty) {
                                  pickerFileController.setPlaylistName(_playlistName.text);
                                  pickerFileController.savePlaylist();
                                  setState(() {
                                    labelImageName = 'Adicionar imagem';
                                    isDialog = false;
                                  });
                                }
                              },
                              child: _actionButton('Confirmar', _playlistName.text.isNotEmpty ? Colors.white : Colors.white10)),
                          const SizedBox(height: 18),
                          ContainerPlus(
                            onTap: () {
                              setState(() {
                                pickerFileController.clearMusicData();
                                labelImageName = 'Adicionar imagem';
                                isDialog = false;
                              });
                            },
                            child: _actionButton(
                                'Cancelar', Colors.white
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width * 0.88,
              ),
            ],
          )),
    ),
    );
  }

  Widget _dialogCustomMusic(BuildContext context) {
    return Observer(builder: (_) => ContainerPlus(
      child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerPlus(
                padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 34),
                radius: RadiusPlus.all(20),
                color: Colors.black.withOpacity(0.96),
                child: ContainerPlus(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextPlus(
                        'Montando a sua playlist',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      //  const SizedBox(height: 44),
                      Column(
                        children: [
                          _addPickFile(labelMusicName.toString(), pickFileMusic),
                          const SizedBox(height: 16),
                          _addPickFile(labelImageName.toString(), pickFileImage)
                        ],
                      ),
                      //  const SizedBox(height: 40),
                      Column(
                        children: [
                          ContainerPlus(
                              onTap: () {
                                if (pickerFileController.fileMusicName != null) {
                                  print(pickerFileController.playlist);
                                 pickerFileController.saveMusic(pickerFileController.playlist);
                                  setState(() {
                                    labelMusicName = 'Adicionar música';
                                    labelImageName = 'Adicionar imagem';
                                    isDialog = false;
                                  });
                                }
                              },
                              child: _actionMusicButton('Confirmar', pickerFileController.fileMusicName != null ? Colors.white : Colors.white10)),
                          const SizedBox(height: 18),
                          ContainerPlus(
                            onTap: () {
                              setState(() {
                                pickerFileController.clearMusicData();
                                labelMusicName = 'Adicionar música';
                                labelImageName = 'Adicionar imagem';
                                isDialog = false;
                              });
                            },
                            child: _actionMusicButton(
                                'Cancelar', Colors.white
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width * 0.88,
              ),
            ],
          )),
    ),
    );
  }

  Widget _addPickFile(String labelName, void Function() pickFile){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerPlus(
          width: 260,
          child: TextPlus(
            labelName,
            color: Colors.white,
            fontSize: 16,
            textOverflow: TextOverflow.visible,
          ),
        ),
        ContainerPlus(
            border: BorderPlus(color: Colors.purple),
            radius: RadiusPlus.all(40),
            child: InkWell(
              onTap: () {
                pickFile();
              },
              child: const Icon(
                Icons.add,
                color: Colors.purple,
              ),
            )
        ),
      ],
    );
  }

  // ##################      FILE PICKER IMAGE     ################

  void pickFileImage() async{
    try {
      setState(() {
        isLoadingImage = true;
      });
      imageResult = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if(imageResult != null){

        labelImageName = imageResult!.files.first.name;
        pickedFileImage = imageResult!.files.first;

        final newFileImage = await saveFileImagePermanently(pickedFileImage!);
        fileToDisplayImage = newFileImage;
        pickerFileController.setImagePlaylist(newFileImage.path);

      }
      setState(() {
        isLoadingImage = false;
      });
    } catch(e){
      // print(e);
    }

  }

  void pickFileMusic() async{
    try {
      setState(() {
        isLoadingMusic = true;
      });
      musicResult = await FilePicker.platform.pickFiles();
      if(musicResult != null){
        labelMusicName = musicResult!.files.first.name;
        pickedFileMusic = musicResult!.files.first;

        final newFileMusic = await saveFileMusicPermanently(pickedFileMusic!);
        fileToDisplayMusic = newFileMusic;
        pickerFileController.setFileToDisplay(newFileMusic.path);
        pickerFileController.setFileMusic(newFileMusic.fileName);

      }
      setState(() {
        isLoadingMusic = false;
      });
    } catch(e){
      // print(e);
    }

  }

  // ##############     FILE PERMANENTLY MUSIC    ###############

  Future<File> saveFileMusicPermanently(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFileMusic = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFileMusic.path);
  }

  // ##############     FILE PERMANENTLY IMAGE    ###############

  Future<File> saveFileImagePermanently(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFileImage = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFileImage.path);
  }

  Widget _floatingActionButton(){
    return InkWell(
      onTap: (){
        setState(() {
          isDialog = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ShaderMask(
          shaderCallback: (bounds) {
            return const RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: [
                Colors.purple,
                Colors.purpleAccent,
                Colors.deepPurple,
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.add,
            size: 54,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String buttonName, Color color){
    return  ContainerPlus(
      radius: RadiusPlus.all(20),
      width: 300,
      height: 40,
      color: Colors.white10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextPlus(
            buttonName,
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }

  Widget _actionMusicButton(String buttonName, Color color){
    return  ContainerPlus(
      radius: RadiusPlus.all(20),
      width: 300,
      height: 40,
      color: Colors.white10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextPlus(
            buttonName,
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }

}
