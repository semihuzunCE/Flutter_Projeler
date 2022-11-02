import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/services/pokedex_api.dart';
import 'package:flutter_pokedex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("pokelist build çalıştı");
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> listem = snapshot.data!;
          return GridView.builder(
            itemCount:listem.length ,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ScreenUtil().orientation==Orientation.portrait ? 2 : 3),
              itemBuilder: ((context, index) {
                debugPrint("itembuilder çalıştı");
                var oankiPokemon = listem[index];
                return PokeListItem(pokemon: oankiPokemon);
              }));
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Veri Çekilemedi"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
