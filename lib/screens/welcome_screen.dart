import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:poke_app/screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Poke App',
                      speed: Duration(milliseconds: 500),
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(color: Colors.amberAccent)),
                ],
                totalRepeatCount: 1,
                onFinished: () =>
                    setState(() => Navigator.pushNamed(context, HomeScreen.id)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
