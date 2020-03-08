import 'package:flutter/material.dart';
import 'package:mycycles/screens/home_screen.dart';
import 'package:mycycles/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Cycles',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
