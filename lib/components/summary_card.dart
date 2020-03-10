import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SummaryCard extends StatefulWidget {
  final String title;
  final String summary;
  final double percentage;
  final Function onTap;

  const SummaryCard({this.title, this.summary, this.percentage, this.onTap});

  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
        child: Padding(
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
                  percent: widget.percentage,
                  header: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      widget.title,
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                  center: new Text(
                    widget.summary,
                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.pink,
                ),
              ),
            ],
          ),
        ),
        onTap: widget.onTap != null ? () => widget.onTap() : () => print('not set'),
      ),
    );
  }
}
