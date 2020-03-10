import 'package:flutter/material.dart';
import 'package:mycycles/services/auth_service.dart';

class MainAppBar extends StatefulWidget {
  final String title;

  const MainAppBar({this.title});

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1.0,
      title: Text(widget.title,
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 17.0, fontWeight: FontWeight.w600, letterSpacing: 1.5)),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: new IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await authService.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
        )
      ],
    );
  }
}
