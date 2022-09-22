import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:golf_score_sheet/screens/login.dart';
import 'package:golf_score_sheet/screens/register.dart';
import 'package:golf_score_sheet/screens/score_sheet.dart';
import 'package:golf_score_sheet/src/utils/themes/theme.dart';

Future<void> main() async {
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
        '/scoreSheet': (context) => const ScoreSheet(),
      },
      theme: TAppTheme.lightTheme,
      //ThemeData(
      //   primarySwatch: Colors.green,
      //   scaffoldBackgroundColor: Colors.yellow[100],
      // ),
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.headline4),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/golf_course.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    minimumSize: Size(100, 20),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 10,
                  width: 50,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 10,
                    minimumSize: Size(100, 20),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text("Register"),
                ),
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
