// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoPlayerController on _VideoPlayerController, Store {
  late final _$maxResultAtom =
      Atom(name: '_VideoPlayerController.maxResult', context: context);

  @override
  int get maxResult {
    _$maxResultAtom.reportRead();
    return super.maxResult;
  }

  @override
  set maxResult(int value) {
    _$maxResultAtom.reportWrite(value, super.maxResult, () {
      super.maxResult = value;
    });
  }

  late final _$searchAtom =
      Atom(name: '_VideoPlayerController.search', context: context);

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  @override
  String toString() {
    return '''
maxResult: ${maxResult},
search: ${search}
    ''';
  }
}
