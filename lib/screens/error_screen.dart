import 'package:flutter/material.dart';
import 'package:poke_app/main.dart';
import 'package:poke_app/utility/reusable_button.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(flex: 5, child: Image.asset('images/oops.png')),
            ReusableButton(buttonText: "Let's Try Again!", Screen: PokeApp()),
          ],
        ),
      ),
    );
  }
}
