import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedexapp/widgets/AppTitle.dart';

import 'package:pokedexapp/widgets/pokemonList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          pokemonList(),
        ],
      ),
    );
  }
}
