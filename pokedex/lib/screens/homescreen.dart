import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/services/pokeapi_service.dart';
import 'package:pokedex/widgets/pokemon_grid.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<PokemonModel> pokemonList = List.empty();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPokemon();
  }

  void fetchPokemon() async {
    List<PokemonModel> fetchPokemon = await PokeapiService.getPokemon();
    setState(() {
      pokemonList = fetchPokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pokedex'),
      ),
      body: pokemonList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PokemonGrid(pokemonList: pokemonList),
    );
  }
}
