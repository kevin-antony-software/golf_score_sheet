import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var brightOfScreen = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
