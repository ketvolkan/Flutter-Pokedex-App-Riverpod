import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constants/constants.dart';
import 'package:pokedexapp/constants/uiHelper.dart';
import 'package:pokedexapp/models/pokemon.dart';
import 'package:pokedexapp/providers/pokemonProviders.dart';

class pokemonListItem extends ConsumerWidget {
  Pokemon pokemon;
  pokemonListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      elevation: 3,
      shadowColor: Colors.white,
      color: UIHelper.getColorFromType(pokemon.type![0]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                pokemon.name.toString(),
                style: Constants.getPokemonNameTextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/pokeball.png',
                  width: UIHelper.calculatePokeImgAndBallSize(),
                  height: UIHelper.calculatePokeImgAndBallSize(),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.img ?? '',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.ac_unit),
                    width: UIHelper.calculatePokeImgAndBallSize(),
                    height: UIHelper.calculatePokeImgAndBallSize(),
                    fit: BoxFit.fitHeight,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: UIHelper.getColorFromType(pokemon.type![0]),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
