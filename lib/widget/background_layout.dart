import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class BackgroundLayout extends StatefulWidget {
  const BackgroundLayout({Key? key}) : super(key: key);

  @override
  State<BackgroundLayout> createState() => _BackgroundLayoutState();
}

class _BackgroundLayoutState extends State<BackgroundLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * -0.10,
          left: MediaQuery.of(context).size.width - (240 / 1.0),
          child: ContainerPlus(
            height: 400,
            width: 400,
            color: Colors.black12,
            radius: RadiusPlus.all(500),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * -0.050,
          left: MediaQuery.of(context).size.width - (240 / 1.3),
          child: ContainerPlus(
            height: 300,
            width: 300,
            color: Color(0x31000000),
            radius: RadiusPlus.all(500),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.00,
          left: MediaQuery.of(context).size.width - (240 / 1.8),
          child: ContainerPlus(
            height: 200,
            width: 200,
            color: Colors.black26,
            radius: RadiusPlus.all(500),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          left: MediaQuery.of(context).size.width - (240 / 2.7),
          child: ContainerPlus(
            height: 100,
            width: 100,
            color: Color(0x45000000),
            radius: RadiusPlus.all(500),
          ),
        ),
      ],
    );
  }
}
