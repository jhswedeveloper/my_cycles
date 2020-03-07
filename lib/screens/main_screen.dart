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

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(events: {
    new DateTime(2020, 3, 10): [
      new Event(
        date: new DateTime(2020, 3, 10),
        title: 'Event 1',
        icon: _presentIcon(DateTime(2020, 3, 10).day.toString()),
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
          icon: _presentIcon(DateTime(2020, 3, 11).day.toString()),
        ));
    _markedDateMap.add(
        new DateTime(2020, 3, 12),
        new Event(
          date: new DateTime(2020, 3, 12),
          title: 'mens',
          icon: _presentIcon(DateTime(2020, 3, 12).day.toString()),
        ));

    super.initState();
  }

  static Widget _presentIcon(String day) => Container(
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

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.indigo,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendarCarouselNoHeader,
            markerRepresent(Colors.red, "Absent"),
            markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }
}
