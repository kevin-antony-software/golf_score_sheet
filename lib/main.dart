import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:golf_score_sheet/screens/login.dart';
import 'package:golf_score_sheet/screens/register.dart';

import 'components/buttons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Score Sheet',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "Golf Score Sheet"),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.yellow[100],
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/golf_course.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HomeButton('/login', "Login"),
                SizedBox(
                  height: 10,
                  width: 50,
                ),
                HomeButton('/register', "Register"),
              ],
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
