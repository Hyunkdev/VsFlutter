import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonGrid extends StatelessWidget {
  final List<PokemonModel> pokemonList;

  const PokemonGrid({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(pokemon.front_default, height: 100),
              const SizedBox(height: 8),
              Text(
                pokemon.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('ID: ${pokemon.id}'),
            ],
          ),
        );
      },
    );
  }
}
