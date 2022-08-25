// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_app/main.dart';

import 'package:poke_app/screens/pokemon_screen.dart';
import 'error_screen.dart';

class LoadingScreenForSearch extends StatefulWidget {
  const LoadingScreenForSearch({@required this.pokeSearch});
  final pokeSearch;

  @override
  State<LoadingScreenForSearch> createState() => _LoadinScreenForSearchState();
}

class _LoadinScreenForSearchState extends State<LoadingScreenForSearch> {
  @override
  void initState() {
    super.initState();
    pokemonGenerator();
  }

  late String pokeSearchString = widget.pokeSearch;

  String nameOfPokemon = 'Generating Pokemon';

  Future pokemonGenerator() async {
    print(pokeSearchString);
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeSearchString/');

    http.Response response = await http.get(url);
    String data = response.body;

    if (response.statusCode != 200) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ErrorScreen();
          },
        ),
      );
    }
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
    return Scaffold(
      body: SpinKitFoldingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
