import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/models/pokemon.dart';
import 'package:pokedexapp/providers/pokemonProviders.dart';
import 'package:pokedexapp/widgets/pokemonListItem.dart';

class pokemonList extends ConsumerWidget {
  const pokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pokemonCount = ref.watch(pokemonCountProvider);
    List<Pokemon> _pokeList = ref.watch(pokemonListProvider);
    return Expanded(
      child: Container(
        height: 200,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
          itemCount: pokemonCount,
          itemBuilder: (context, index) {
            return pokemonListItem(pokemon: _pokeList[index]);
          },
        ),
      ),
    );
  }
}
