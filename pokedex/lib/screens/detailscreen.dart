import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/pokeapi_service.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key, required this.pokemon});

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

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 231, 255),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 860,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.network(
                      pokemon.front_default,
                      height: 160,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No.${pokemon.id}  ${pokemon.name}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        color: const Color.fromARGB(255, 222, 231, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          pokemon.species,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 32,
                      decoration: BoxDecoration(
                        color: pokemon.color == 'white'
                            ? getColorFromString('black')
                            : getColorFromString(pokemon.color),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        pokemon.types[0].name,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
