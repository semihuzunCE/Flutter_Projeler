import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeImageandBall extends StatelessWidget {
  final String _pokeballImagePath = "images/pokeball.png";
  final PokemonModel pokemon;

  const PokeImageandBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            _pokeballImagePath,
            width: UIHelper.calculatePokeImgandBallWidth(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
            placeholderFadeInDuration: const Duration(seconds: 2),
            imageUrl: pokemon.img!,
            width: UIHelper.calculatePokeImgandBallWidth(),
            placeholder: (context, url) {
              return CircularProgressIndicator(
                color: UIHelper.getColorwithType(pokemon.type![0]),
              );
            },
          ),
        )
      ],
    );
  }
}
