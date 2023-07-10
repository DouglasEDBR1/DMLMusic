import 'package:dml_music/models/music_model.dart';
import 'package:dml_music/repositories/home_repositoriy.dart';
import 'package:flutter/cupertino.dart';

//Foi feito uma injeção do HomeRepository
// Quem criar o controle terá que passar uma instância de HomeRepository
// Foi criado um valueNotifier para musics
// pega a lista e atribui os valores para valueNotifier(musics)

class HomeController {

  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<MusicList>> musics = ValueNotifier<List<MusicList>>([]);

  fetch() async {
    musics.value = await _homeRepository.getList();
  }
}