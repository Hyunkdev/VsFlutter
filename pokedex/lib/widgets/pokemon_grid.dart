import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/screens/detailscreen.dart';

class PokemonGrid extends StatelessWidget {
  Color getColorFromString(String color) {
    switch (color.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'white':
        return const Color.fromARGB(127, 255, 255, 255);
      case 'purple':
        return const Color.fromARGB(255, 206, 120, 221);
      case 'pink':
        return const Color.fromARGB(255, 248, 168, 195);
      case 'brown':
        return Colors.brown;
      case 'gray':
        return Colors.grey;
      default:
        return Colors.black; // 기본 색상 설정 (혹은 다른 색상)
    }
  }

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
                color: getColorFromString(pokemon.color),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(pokemon.front_default, height: 80),
                    const SizedBox(height: 8),
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: pokemon.color == 'black'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Text(
                      'No.${pokemon.id}',
                      style: TextStyle(
                        color: pokemon.color == 'black'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
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
