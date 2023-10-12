import 'package:flutter/material.dart';
import 'package:pokedex/widgets/app_title.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(       //orientation degisikliginde buildi tetiklemesi icin sarmaladdım.
        builder: (context, orientation) {
          return const Column(
            children: [
              AppTitle(),
              Expanded(child: PokemonList()), //scroll oldugu icın hatayı onlemek adına expanded
            ],
          );
        },
      ),
    );
  }
}
