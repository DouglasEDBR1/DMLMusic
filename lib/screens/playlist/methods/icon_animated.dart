import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../controllers/music_player_controller.dart';


class IconAnimatedUtils extends StatefulWidget {
  const IconAnimatedUtils({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  State<IconAnimatedUtils> createState() => _IconAnimatedUtilsState();
}

class _IconAnimatedUtilsState extends State<IconAnimatedUtils> {

  final mediaPlayerController = GetIt.I<MediaPLayerController>();
  bool iconAnimatedController = false;


  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => AvatarGlow(
      animate: mediaPlayerController.playing,
      glowColor: Colors.purpleAccent,
      endRadius: 90.0,
      duration: const Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: const Duration(milliseconds: 100),
      child: ShaderMask(
        shaderCallback: (bounds) {
          return const RadialGradient(
            center: Alignment.topLeft,
            radius: 1,
            colors: [
              Colors.purpleAccent,
              Colors.deepPurple
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Icon(
          Icons.headphones,
          size: widget.size,
          color: Colors.white,
        ),
      ),
    ),
    );
  }
}
