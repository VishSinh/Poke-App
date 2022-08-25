import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({@required this.buttonText, @required this.Screen});
  final buttonText, Screen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Screen;
        }));
      },
      child: ReusableCard(
        colour: const Color(0xFF1D1E33),
        cardChild: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ),
    );
  }
}
