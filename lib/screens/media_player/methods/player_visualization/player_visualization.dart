import 'package:dml_music/controllers/music_player_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:get_it/get_it.dart';

class PlayerVisualization extends StatefulWidget {
  const PlayerVisualization({Key? key}) : super(key: key);

  @override
  State<PlayerVisualization> createState() => _PlayerVisualizationState();
}

class _PlayerVisualizationState extends State<PlayerVisualization> with SingleTickerProviderStateMixin{

  late final FlutterGifController? _gifController = FlutterGifController(vsync: this);
  final mediaPlayerController = GetIt.I<MediaPLayerController>();


  @override
  void initState(){
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  }

  @override
  void dispose() {
    super.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {

      mediaPlayerController.playing == false
      ?_gifController!.repeat(min:0, max:30, period: const Duration(milliseconds: 1200))
      :_gifController!.repeat(min:0, max:30, period: const Duration(milliseconds: 600));

      return GifImage(
        height: 300,
        width: 300,
        controller: _gifController!,
        image: const AssetImage('assets/images/wave_form3.gif'),
      );
    }

    );
  }
}
