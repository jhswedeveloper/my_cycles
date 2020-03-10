import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycycles/screens/home_screen.dart';
import 'package:mycycles/screens/login_screen.dart';
import 'package:mycycles/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
      ],
      child: MaterialApp(
        title: 'My Cycles',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.cyan,
          fontFamily: 'OpenSans'
        ),
      ),
    );
  }
}
