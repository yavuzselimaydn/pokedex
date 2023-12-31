import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImgAndLogo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndLogo({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Align(   //stackde ilk eleman altta olur,digerleri ustune gelir
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
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(    //kutuphane sayesinde netten gelen imgler cachede saklanır her seferınde int e cıkmam gerekmez
              errorWidget: (context, url, error) => Image.asset(Constants.logoUrl), //resım gelmezse 
              imageUrl: pokemon.img ?? "", 
              width: UIHelper.calculatePokeImgAndBallSize(),
              height: UIHelper.calculatePokeImgAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator( //resim inten gelene kasdar  gostercegım  ımg
                color: Colors.white,
              ),
            ),
          ),
        ), 
      ],
    );
  }
}
