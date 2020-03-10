import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:mycycles/common/constants.dart';

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
          color: Colors.deepOrangeAccent,
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
      thisMonthDayBorderColor: Colors.transparent,
      selectedDayButtonColor: Color(0xFF30A9B2),
      selectedDayBorderColor: Color(0xFF30A9B2),
      selectedDayTextStyle: TextStyle(color: Colors.white),
      weekendTextStyle: TextStyle(color: Colors.white),
      daysTextStyle: TextStyle(color: Colors.white),
      nextDaysTextStyle: TextStyle(color: Colors.grey),
      prevDaysTextStyle: TextStyle(color: Colors.grey),
      weekdayTextStyle: TextStyle(color: Colors.grey),
      weekDayFormat: WeekdayFormat.short,
      firstDayOfWeek: 0,
      showHeader: true,
      isScrollable: false,
      weekFormat: false,
      height: cHeight * 0.54,
      selectedDateTime: DateTime.now(),
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      /// Headers styling
      headerTextStyle: TextStyle(fontSize: 20.0, color: Colors.white),
      prevMonthDayBorderColor: Colors.white,
      leftButtonIcon: Icon(Icons.navigate_before, color: Colors.white),
      rightButtonIcon: Icon(Icons.navigate_next, color: Colors.white),

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
      body: Container(
//        color: Colors.black12,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                  child: _calendarCarouselNoHeader,
                ),
                markerRepresent(Colors.pink, "Period"),
                markerRepresent(Colors.deepOrangeAccent, "Ovulation"),
              ],
            )
          ],
        ),
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
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
