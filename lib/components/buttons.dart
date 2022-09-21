import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(this.pathName, this.textName);

  final pathName;
  final textName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 10,
        minimumSize: Size(100, 20),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.pushNamed(context, pathName);
      },
      child: Text(textName),
    );
  }
}
