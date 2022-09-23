import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScoreSheet extends StatefulWidget {
  const ScoreSheet({super.key});

  @override
  State<ScoreSheet> createState() => _ScoreSheetState();
}

class _ScoreSheetState extends State<ScoreSheet> {
  @override
  var isSignedIn = false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            isSignedIn = true;
            return ScoreLoggedIn();
          } else {
            isSignedIn = false;
            return ScoreLoggedOut();
          }
        },
      ),
    );
  }
}

class ScoreLoggedIn extends StatelessWidget {
  const ScoreLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Text("ScoreSheet"),
          ),
          Expanded(
            child: TextButton(
              child: Text("logout"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreLoggedOut extends StatelessWidget {
  const ScoreLoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Text("ScoreSheet 1111111"),
          ),
          Expanded(
            child: TextButton(
              child: Text("Login"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
