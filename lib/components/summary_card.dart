import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SummaryCard extends StatefulWidget {
  final String title;
  final String summaryTitle;
  final String summary;
  final double percentage;
  final Function onTap;

  const SummaryCard({this.title, this.summaryTitle, this.summary, this.percentage, this.onTap});

  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(
          colors: [
            Color(0xff2c274c),
            Color(0xff46426c),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
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
                      style: new TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                  ),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        widget.summary,
                        style: new TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      new Text(
                        widget.summaryTitle,
                        style: new TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 1),
                      ),

                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.cyan,
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
