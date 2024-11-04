import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/pokeapi_service.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key, required this.pokemon});

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
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
