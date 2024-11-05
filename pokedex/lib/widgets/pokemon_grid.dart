import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/screens/detailscreen.dart';

class PokemonGrid extends StatelessWidget {
  final List<PokemonModel> pokemonList;

  const PokemonGrid({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 204, 194, 231),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 12,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
          ),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = pokemonList[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(pokemon: pokemon),
                  ),
                );
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(pokemon.front_default, height: 80),
                    const SizedBox(height: 8),
                    Text(
                      pokemon.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('No.${pokemon.id}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
