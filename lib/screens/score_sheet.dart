import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScoreSheet extends StatefulWidget {
  const ScoreSheet({super.key});

  @override
  State<ScoreSheet> createState() => _ScoreSheetState();
}

class _ScoreSheetState extends State<ScoreSheet> {
  @override
  void initState() {
    // TODO: implement initState

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! $user ');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      print("user Logged in :  " + user!.email.toString());
    });
    return Container();
  }
}
