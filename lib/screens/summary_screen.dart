import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mycycles/components/summary_card.dart';
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
          SummaryCard(
            title: "Cycle length",
            summary: "20 DAYS",
            percentage: 0.7,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen())),
          ),
          SummaryCard(
            title: "Period length",
            summary: "3 DAYS",
            percentage: 0.2,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen())),
          ),
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
