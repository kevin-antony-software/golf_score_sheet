import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  late bool googleSignedIn = false;

  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Text(
                "Login Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: TextField(
                controller: controllerUsername,
                onChanged: (userName) {
                  email = userName;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: TextField(
                obscureText: true,
                controller: controllerPassword,
                onChanged: (value) {
                  password = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Text(
                "Forgot Password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, '/scoreSheet');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      if (kDebugMode) {
                        print('No user found for that email.');
                      }
                    } else if (e.code == 'wrong-password') {
                      if (kDebugMode) {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }
                },
                child: Text('Login'.toUpperCase()),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
