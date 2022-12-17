import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'loading_screen_search.dart';
import '../utility/reusable_button.dart';
import '../utility/reusable_card.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
