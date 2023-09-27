import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body:  SafeArea( // teldeki bildirim paneli ile direk uygulama arasına paddidng koyar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: UIHelper.defaultPadding(),
              iconSize: 24.w, // dikeyde genislik 360 ken , yatayda genislik 720 oldugu icin yatay modda icon size buyudu
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: const Icon(Icons.arrow_back_ios),
            ),
            PokeTypeName(pokemon: pokemon),



          ],
        ) 
      ),
    );
  }
}