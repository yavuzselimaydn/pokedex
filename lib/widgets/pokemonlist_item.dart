import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_img_and_url.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.w),
      ),
      elevation: 3,
      shadowColor: Colors.white,
      color: UIHelper.getColorFromType(pokemon.type![0]),
      child: Padding(
        padding: UIHelper.defaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            pokemon.name ?? "N/A",
            style: Constants.pokeNameStyle(),
          ),
          Chip(
              label: Text(
            pokemon.type![0],
            style: Constants.pokeTypeStyle(),
          )),
          Expanded(child: PokeImgAndUrl(pokemon: pokemon)) //resım sıgsın dıye expanded
        ]),
      ),
    );
  }
}
