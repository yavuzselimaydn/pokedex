import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeApi{

  static const String _url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> list = [];

    var response = await Dio().get(_url);                 //url sonunda .json var yani datayı striing olarak okucak, jsonDecode lazım

    var pokeList = jsonDecode(response.data)["pokemon"];  //string olarak geldigi icin jsona cevirdim, listede pokemon keyinde 

    if(pokeList is List){                                 //is ile pokelist in turu listemi kontrol eettıtom
      list = pokeList.map(
          (e) => PokemonModel.fromJson(e),
        ).toList();
    }
    
    return list;
  }
  
}