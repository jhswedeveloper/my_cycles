import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mycycles/screens/profile_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent: 0.7,
                        center: new Text(
                          "20 DAYS",
                          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        header: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            "Cycle length",
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.pink,
                      ),
                    ),
                  ]),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen())),
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent: 0.7,
                        center: new Text(
                          "20 DAYS",
                          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        header: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            "Cycle length",
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.pink,
                      ),
                    ),
                  ]),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen())),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 220.0),
          StaggeredTile.extent(1, 220.0),
          StaggeredTile.extent(2, 220.0),
          StaggeredTile.extent(2, 110.0),
        ],
      ),
    );
  }
}
