import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImgAndUrl extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndUrl({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.logoUrl,
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            errorWidget: (context, url, error) => Image.asset(Constants.logoUrl),
            imageUrl: pokemon.img ?? "", //kutup sayesinde netten gelen imgler cachede saklanır her seferınde int e cıkmam gerekmez
            width: UIHelper.calculatePokeImgAndBallSize(),
            height: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => const CircularProgressIndicator( //resim inten gelene kasdar  gostercegım  ımg
              color: Colors.white,
            ),
          ),
        ), 
      ],
    );
  }
}
