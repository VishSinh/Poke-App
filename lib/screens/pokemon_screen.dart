import 'package:flutter/material.dart';
import 'package:poke_app/screens/home_screen.dart';
import 'package:poke_app/utility/reusable_card.dart';

import 'package:poke_app/main.dart';
import 'loading_screen.dart';
import 'package:poke_app/utility/reusable_button.dart';

class PokeScreen extends StatefulWidget {
  PokeScreen({this.pokeData});
  final pokeData;

  @override
  State<PokeScreen> createState() => _PokeScreenState();
}

class _PokeScreenState extends State<PokeScreen> {
  late String pokeName, imgURL;
  late String pokeType, pokeAbility;
  late String pokeWeight, pokeHeight;

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  void initState() {
    super.initState();

    updateUI(widget.pokeData);
  }

  void updateUI(dynamic pokeData) {
    pokeName = capitalize(pokeData['forms'][0]['name']);
    imgURL = pokeData['sprites']['front_default'];
    pokeType = capitalize(pokeData['types'][0]['type']['name']);
    pokeWeight = pokeData['weight'].toString();
    pokeHeight = pokeData['height'].toString();
    pokeAbility = capitalize(pokeData['abilities'][0]['ability']['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableCard(
              colour: const Color(0xFF1D1E33),
              cardChild: Center(
                child: Text(
                  pokeName,
                  style: const TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            Image.network(
              imgURL,
              scale: 0.50,
            ),
            Table(
              children: [
                TableRow(
                  children: [
                    ReusableCard(
                      colour: const Color(0xFF1D1E33),
                      cardChild: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Type',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    ReusableCard(
                      colour: const Color(0xFF1D1E33),
                      cardChild: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            pokeType,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    ReusableCard(
                      colour: const Color.fromARGB(255, 51, 52, 70),
                      cardChild: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Weight',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    ReusableCard(
                      colour: const Color.fromARGB(255, 51, 52, 70),
                      cardChild: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            '$pokeWeight hg',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    ReusableCard(
                      colour: const Color(0xFF1D1E33),
                      cardChild: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Height',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    ReusableCard(
                      colour: const Color(0xFF1D1E33),
                      cardChild: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            '$pokeHeight dm',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    ReusableCard(
                      colour: const Color.fromARGB(255, 51, 52, 70),
                      cardChild: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Ability',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    ReusableCard(
                      colour: const Color.fromARGB(255, 51, 52, 70),
                      cardChild: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            pokeAbility,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableButton(
                  buttonText: 'Home',
                  Screen: HomeScreen(),
                ),
                ReusableButton(
                  buttonText: 'Generate Another',
                  Screen: LoadingScreen(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
