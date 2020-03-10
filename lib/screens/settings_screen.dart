import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          Card(
            elevation: 5.0,
            child: ListTile(
              title: Text('Period'),
              subtitle: Text('Your next cycle is about to begin.'),
              trailing: Icon(Icons.arrow_forward_ios, size: 14.0),
            ),
          ),
          Card(
            elevation: 5.0,
            child: ListTile(
              title: Text('Period Late'),
              subtitle: Text('Your next cycle seems to be late.'),
              trailing: Icon(Icons.arrow_forward_ios, size: 14.0),
            ),
          ),
          Card(
            elevation: 5.0,
            child: ListTile(
              title: Text('Use My Cycle'),
              subtitle: Text('Track symptoms.'),
              trailing: Icon(Icons.arrow_forward_ios, size: 14.0),
            ),
          ),
          Card(
            elevation: 5.0,
            child: SwitchListTile(
              title: Text('Before Fertile Window'),
              subtitle: Text('Your fertile window is coming up.'),
              selected: true,
              activeColor: Colors.white,
              onChanged: (val) {},
              value: true,
            ),
          ),
          Card(
            elevation: 5.0,
            child: SwitchListTile(
              title: Text('Ovulation Day'),
              subtitle: Text('You are estimated to ovulate today.'),
              selected: true,
              activeColor: Colors.white,
              onChanged: (val) {},
              value: false,
            ),
          ),
          Card(
            elevation: 5.0,
            child: SwitchListTile(
              title: Text('After Fertile Window'),
              subtitle: Text('Looks like your fertile window has ended.'),
              selected: true,
              activeColor: Colors.white,
              onChanged: (val) {},
              value: true,
            ),
          ),
          Card(
            elevation: 5.0,
            child: SwitchListTile(
              title: Text('Before PMS'),
              subtitle: Text('PMS is coming up.'),
              selected: true,
              activeColor: Colors.white,
              onChanged: (val) {},
              value: false,
            ),
          )
        ],
      ),
    );
  }
}
