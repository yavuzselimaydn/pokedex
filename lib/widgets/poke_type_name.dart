import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? "",
                  style: Constants.pokeNameStyle(),
                ),
              ),

              Text("#${pokemon.num}", style: Constants.pokeNameStyle())
            ],
          ),
          SizedBox(height: 0.02.sh,),
          Chip(
            label: Text(
              pokemon.type?.join(" , ") ?? "", // .join ile listedeki elemanları birlestırırım
              style: Constants.pokeTypeStyle(),
            ),
          )
        ],
      ),
    );
  }
}
