import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mycycles/common/constants.dart';
import 'package:mycycles/components/main_app_bar.dart';
import 'package:mycycles/components/menu_drawer.dart';
import 'package:mycycles/components/summary_card.dart';
import 'package:mycycles/components/summary_line_chart.dart';
import 'package:mycycles/screens/profile_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
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
            title: "Cycle Length",
            summaryTitle: "DAYS",
            summary: "20",
            percentage: 0.7,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen())),
          ),
          SummaryCard(
            title: "Period Length",
            summaryTitle: "DAYS",
            summary: "3",
            percentage: 0.2,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen())),
          ),
          SummaryLineChart(),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 220.0),
          StaggeredTile.extent(1, 220.0),
          StaggeredTile.extent(4, 250.0),
          StaggeredTile.extent(2, 110.0),
        ],
      ),
    );
  }
}
