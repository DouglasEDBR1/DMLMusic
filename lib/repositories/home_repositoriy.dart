import '../models/music_model.dart';

//Criando um contrato
// Devolve uma lista de MusicList(model), chamando de getList

abstract class HomeRepository{
  Future<List<MusicList>> getList();
}