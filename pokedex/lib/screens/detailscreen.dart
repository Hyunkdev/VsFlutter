import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('ID : ${pokemon.id}'),
          ],
        ),
      ),
    );
  }
}
