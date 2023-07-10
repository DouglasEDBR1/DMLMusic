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
import '../../models/playlist_model.dart';
import 'methods/icon_animated.dart';

import 'dart:io';



class PlaylistLocalScreen extends StatefulWidget {
  const PlaylistLocalScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistLocalScreen> createState() => _PlaylistLocalScreenState();
}

class _PlaylistLocalScreenState extends State<PlaylistLocalScreen> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();
  final pickerFileController = GetIt.I<PickerFileController>();

  bool isDialog = false;
  final _bandTitle = TextEditingController();

  //    PICKER FILE
  FilePickerResult? musicResult, imageResult;
  String? labelMusicName = 'Adicionar música', labelImageName = 'Adicionar imagem';
  PlatformFile? pickedFileMusic, pickedFileImage;
  bool isLoadingImage = false, isLoadingMusic = false, iconAnimatedController = false;
  File? fileToDisplayMusic, fileToDisplayImage;

  @override
  void initState() {
    super.initState();
    pickerFileController.init();
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
                    TextPlus(
                      'Minha Playlist',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10,),
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
          Observer(builder: (_) => Padding(
            padding: const EdgeInsets.only(top: 140),
            child: ContainerPlus(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(4),
                      shrinkWrap: true,
                      addRepaintBoundaries: true,
                      addAutomaticKeepAlives: true,
                      itemCount: pickerFileController.playlist.length,
                      itemBuilder:  (_, index) {
                        var playList = pickerFileController.playlist.elementAt(index);
                        return _createItemList(context, index, playList);
                      }
                  ),
                ],
              ),
            ),
          ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: isDialog ? _dialogCustomPlaylist(context) : Container(),
            ),
          )
        ],
      ),
    );
  }


  // ###############       METHODS      ################

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
        pickerFileController.setImageAlbum(newFileImage.path);

      }
      setState(() {
        isLoadingImage = false;
      });
    } catch(e){
      // print(e);
    }

  }

  // ##################     FILE PICKER MUSIC      ################

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

  // ##############    FILE PERMANENTLY IMAGE    ###############

  Future<File> saveFileImagePermanently(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFileImage = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFileImage.path);
  }


  // ##############     FILE PERMANENTLY MUSIC    ###############

  Future<File> saveFileMusicPermanently(PlatformFile file) async{
    final appStorage = await getApplicationDocumentsDirectory();
    final newFileMusic = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFileMusic.path);
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
                  color: Colors.black.withOpacity(0.72),
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
                                    pickerFileController.saveMusic();
                                    setState(() {
                                      labelMusicName = 'Adicionar música';
                                      labelImageName = 'Adicionar imagem';
                                      isDialog = false;
                                    });
                                  }
                                },
                                child: _actionButton('Confirmar', pickerFileController.fileMusicName != null ? Colors.white : Colors.white10)),
                            const SizedBox(height: 18),
                            ContainerPlus(
                              onTap: () {
                                setState(() {
                                  pickerFileController.limparDados();
                                  labelMusicName = 'Adicionar música';
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

  Widget _floatingActionButton(){
    return InkWell(
      onTap: (){
        setState(() {
          _bandTitle.clear();
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

  Widget _createItemList(context, index, MusicPlaylistModel musicPlaylist){

    return Dismissible(
      key: Key( DateTime.now().millisecondsSinceEpoch.toString() ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        //Remove item da lista
        pickerFileController.deleteFile(musicPlaylist);

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
            _cardAlbumImage(musicPlaylist),
          ],
        ),
      ),
    );
  }

  Widget _cardAlbumImage(MusicPlaylistModel musicPlaylist){

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
                  mediaPlayerController
                      .setMyPlaylistImage(musicPlaylist.albumImage);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextPlus(musicPlaylist.id.toString(), color: Colors.white,),
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

}