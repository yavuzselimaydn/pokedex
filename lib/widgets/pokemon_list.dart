import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokemon_api.dart';
import 'package:pokedex/widgets/pokemonlist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build calıstı"); //orientation degistiginde build zaten tetikleniyor.
    return FutureBuilder<List<PokemonModel>>( //oritation builder da oritation degistiginde builderı tekllıyo yanı zor tasarımda kullan
      future: _pokemonList,
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          List<PokemonModel> _list = snapshot.data!;
          debugPrint("grid view caalıstı");
          return GridView.builder(
            itemCount: _list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3
            ),
            itemBuilder: (context, index) {
              debugPrint("itembuilder caalıstı");
              var oankiEleman = _list[index];
              return PokemonListItem(pokemon: oankiEleman);
            },
          );
        } 
        
        else if (snapshot.hasError) {
          return const Center(
            child: Text("Hata Geldi"),
          );
        } 

        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
