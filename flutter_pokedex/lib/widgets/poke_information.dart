import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String prevEvo="";
    String nextEvo="";
    if(pokemon.prevEvolution !=null)
   { for(int i=0;i<pokemon.prevEvolution!.length;i++){
    prevEvo+=pokemon.prevEvolution![i].name!;
     prevEvo+=", ";
    }
    }else{
      prevEvo="Not Available";
    }
     if(pokemon.nextEvolution !=null)
   { for(int i=0;i<pokemon.nextEvolution!.length;i++){
    nextEvo+=pokemon.nextEvolution![i].name!;
     nextEvo+=", ";
    }
    }else{
      nextEvo="Not Available";
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
      ),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          _buildInformationRow("Name", pokemon.name),
          _buildInformationRow("Height", pokemon.height),
          _buildInformationRow("Weight", pokemon.weight),
          _buildInformationRow("Spawn Time", pokemon.spawnTime),
          _buildInformationRow("Weakness", pokemon.weaknesses?.join(',')),
          _buildInformationRow("Pre Evolution", prevEvo),
          _buildInformationRow("Next Evolution",nextEvo ),

        ]),
      ),
    );
  }

  Row _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(label,style: Constants.getPokeInfoLabelTextStyle(),),
      Text(value.toString(),style: Constants.getPokeInfoTextStyle(),),
    ]);
  }
}
