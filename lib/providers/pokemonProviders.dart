import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constants/constants.dart';
import 'package:pokedexapp/constants/uiHelper.dart';
import 'package:pokedexapp/models/pokemon.dart';

final dioProvider = Provider<Dio>((ref) => Dio(BaseOptions(
    baseUrl:
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/")));
final allPokemonsProdiver = FutureProvider<List<Pokemon>>((ref) async {
  var _dio = ref.watch(dioProvider);
  var _result = await _dio.get("pokedex.json");
  var _pokeList = jsonDecode(_result.data)['pokemon'];
  List<Pokemon> _pokemonList = [];
  if (_pokeList is List) {
    _pokemonList = _pokeList.map((e) => Pokemon.fromJson(e)).toList();
  } else {
    return [];
  }
  debugPrint(_pokemonList.first.toString());
  return _pokemonList;
});
final pokemonCountProvider = Provider<int>(
  (ref) {
    int _count = ref.watch(allPokemonsProdiver).when(data: (_list) {
      return _list.length;
    }, error: (err, stack) {
      return 0;
    }, loading: () {
      return 0;
    });
    return _count;
  },
);
final pokemonListProvider = Provider<List<Pokemon>>((ref) {
  List<Pokemon> pokeList = ref.watch(allPokemonsProdiver).when(data: (_list) {
    return _list;
  }, error: (err, stack) {
    return [];
  }, loading: () {
    return [];
  });
  return pokeList;
});
final currentPokemon = Provider<Pokemon>((ref) {
  throw UnimplementedError();
});
