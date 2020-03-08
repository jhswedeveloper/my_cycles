import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text('Cycle Length'), Text('28 Days')],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text('Period Length'), Text('3 Days')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
