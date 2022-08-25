import 'package:flutter/material.dart';
import 'package:poke_app/screens/loading_screen.dart';
import 'package:poke_app/screens/loading_screen_search.dart';
import 'utility/reusable_button.dart';
import 'utility/reusable_card.dart';

void main() => runApp(const PokeApp());

class PokeApp extends StatefulWidget {
  const PokeApp({Key? key}) : super(key: key);

  @override
  State<PokeApp> createState() => _PokeAppState();
}

class _PokeAppState extends State<PokeApp> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke App',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Pokemon Generator',
            ),
          ),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search a Pokemon',
                        ),
                        controller: myController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoadingScreenForSearch(
                                pokeSearch: myController.text.toLowerCase());
                          }));
                        },
                        child: ReusableCard(
                          colour: const Color(0xFF1D1E33),
                          cardChild: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ReusableButton(
                  buttonText: 'Generate a random Pokemon',
                  Screen: LoadingScreen(),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
