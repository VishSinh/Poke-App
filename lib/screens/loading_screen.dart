import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:poke_app/screens/pokemon_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    pokemonGenerator();
  }

  String nameOfPokemon = 'Generating Pokemon';

  Future pokemonGenerator() async {
    var id = Random().nextInt(248) + 1;
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/${id}/');

    http.Response response = await http.get(url);
    String data = response.body;

    // ignore: use_build_context_synchronously
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PokeScreen(pokeData: jsonDecode(data));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
