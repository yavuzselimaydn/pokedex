import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context)
        : _buildLanscapeBody(context);
  }

  Scaffold _buildLanscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //geri tusu
          IconButton(
            padding: UIHelper.defaultPadding(),
            iconSize: UIHelper.iconSize(),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeTypeName(pokemon: pokemon),
                      Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemon.img ?? "",
                          height: 0.30.sw,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 3, child: Padding(
                  padding: UIHelper.defaultPadding(),
                  child: PokeInformation(pokemon: pokemon),
                ))
              ],
            ),
          )
        ],
      )),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        //otomatik olarak sayfayı bildirim panelinin altında baslatır
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: UIHelper.defaultPadding(),
              iconSize: UIHelper
                  .iconSize(), //24.w, dikeyde genislik 360 ken , yatayda genislik 720 oldugu icin yatay modda icon size buyudu
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            PokeTypeName(pokemon: pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      Constants.logoUrl,
                      height: 0.15.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemon: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? "",
                        height: 0.25.sh,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
