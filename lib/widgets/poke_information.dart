import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({required this.pokemon ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.defaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow("Name", pokemon.name),
            _buildInformationRow("Height", pokemon.height),
            _buildInformationRow("Weight", pokemon.weight),
            _buildInformationRow("Spawn Time", pokemon.spawnTime),
            _buildInformationRow("Weakness", pokemon.weaknesses),
            _buildInformationRow("Pre Evolution", pokemon.prevEvolution),
            _buildInformationRow("Next Evolution", pokemon.nextEvolution),
          ]
        ),
      ),
    );
  }

  _buildInformationRow(String label , dynamic value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style:ScreenUtil().orientation == Orientation.portrait ?Constants.infoLabelTextStylePortrait() : Constants.infoLabelTextStyle(),),

        if(value is List && value.isNotEmpty) 
          Text(value.join(" , "),style: Constants.infoTextStyle(),) // listeleri ekler birbirine ve stirng yapar
        else if(value.isEmpty)
          Text("Not Available",style: Constants.infoTextStyle(),textAlign: TextAlign.end,)
          
        else  
          Text(value.toString(),style: Constants.infoTextStyle(),)
      ],
    );
  }
}
