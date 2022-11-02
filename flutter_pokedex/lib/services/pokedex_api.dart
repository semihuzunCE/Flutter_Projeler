import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemon() async {
    List<PokemonModel> list = [];
    try {
      var response = await Dio().get(_url);
      var pokeList = jsonDecode(response.data)["pokemon"];

      if (pokeList is List) {
        list = pokeList.map((e) => PokemonModel.fromMap(e)).toList();
      }

      return list;
    } on DioError catch (e) {
      debugPrint(e.message);
      return Future.error(e.message);
    }
  }
}
