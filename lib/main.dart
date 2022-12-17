import 'package:flutter/material.dart';
import 'package:poke_app/screens/loading_screen.dart';
import 'package:poke_app/screens/loading_screen_search.dart';
import 'package:poke_app/screens/welcome_screen.dart';
import 'utility/reusable_button.dart';
import 'utility/reusable_card.dart';
import 'screens/home_screen.dart';
import 'screens/error_screen.dart';

void main() => runApp(const PokeApp());

class PokeApp extends StatefulWidget {
  const PokeApp({Key? key}) : super(key: key);

  @override
  State<PokeApp> createState() => _PokeAppState();
}

class _PokeAppState extends State<PokeApp> {
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
        home: WelcomeScreen(),
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
// HomeScreen(myController: myController)
