import 'dart:convert';
import 'package:dml_music/models/music_model.dart';
import 'package:dml_music/repositories/home_repositoriy.dart';
import 'package:flutter/services.dart';

//Foi feito uma implementação do respositório, consumindo os dados
//rootBundle para acessar os dados da pasta assets(json)
//Ao implementar o HomeRepository, obriga a colocar o método ->
// ( Future<List<MusicList>> gestList() ) criado na classe HomeRepository

class HomeRepositoryMock implements HomeRepository{
  @override
  Future<List<MusicList>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);
    return postJson.map((e) => MusicList.fromJson(e)).toList();
  }

}

