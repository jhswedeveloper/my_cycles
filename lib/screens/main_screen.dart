import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double cHeight;
  CalendarCarousel _calendarCarouselNoHeader;

  EventList<Event> _markedDateMap = new EventList<Event>(events: {
    new DateTime(2020, 3, 10): [
      new Event(
        date: new DateTime(2020, 3, 10),
        title: 'Event 1',
        icon: _periodMarker(DateTime(2020, 3, 10).day.toString()),
      ),
    ],
  });

  @override
  void initState() {
    _markedDateMap.add(
        new DateTime(2020, 3, 11),
        new Event(
          date: new DateTime(2020, 3, 11),
          title: 'mens',
          icon: _periodMarker(DateTime(2020, 3, 11).day.toString()),
        ));
    _markedDateMap.add(
        new DateTime(2020, 3, 12),
        new Event(
          date: new DateTime(2020, 3, 12),
          title: 'mens',
          icon: _periodMarker(DateTime(2020, 3, 12).day.toString()),
        ));
    _markedDateMap.add(
        new DateTime(2020, 3, 20),
        new Event(
          date: new DateTime(2020, 3, 20),
          title: 'mens',
          icon: _ovulationMarker(DateTime(2020, 3, 20).day.toString()),
        ));

    super.initState();
  }

  static Widget _periodMarker(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  static Widget _ovulationMarker(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),

      markedDateCustomTextStyle: TextStyle(
        color: Colors.indigo, // here
        fontWeight: FontWeight.bold,
      ),

      /// Header weekday style
      headerTextStyle: TextStyle(fontSize: 20.0, color: Colors.black),
      weekdayTextStyle: TextStyle(color: Colors.black),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),

      /// Today style
      todayButtonColor: Colors.grey,

      /// Events marker style
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _calendarCarouselNoHeader,
              markerRepresent(Colors.pink, "Mens"),
              markerRepresent(Colors.yellow, "Ovulation"),
            ],
          )
        ],
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      dense: true,
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.018,
      ),
      title: new Text(
        data,
      ),
    );
  }
}
