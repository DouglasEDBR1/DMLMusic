import 'package:dml_music/controllers/music_player_controller.dart';
import 'package:dml_music/screens/home_screen/home_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'controllers/picker_file_controller.dart';


void main(){

  _registerStores();
  _registerStoresFile();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePlusScreen(),
  ));
}

void _registerStores(){
  GetIt getIt = GetIt.I;
  getIt.registerSingleton(MediaPLayerController());
}

void _registerStoresFile(){
  GetIt getIt = GetIt.I;
  getIt.registerSingleton(PickerFileController());
}
