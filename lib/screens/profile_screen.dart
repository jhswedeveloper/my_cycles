import 'package:flutter/material.dart';
import 'package:mycycles/common/loader.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  DateTime _dob = DateTime.now();
  String _email = 'junhuhdev@gmail.com';
  String _name = 'Jun Huh';

  Future selectDate(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingScreen()
        : Scaffold(
            body: Container(
              padding: EdgeInsets.all(35.0),
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    initialValue: _name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Name',
                      hintText: 'Name...',
                    ),
                    onChanged: (val) {
                      _name = val;
                    },
                  ),
                  TextFormField(
                    initialValue: _email,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email address',
                      hintText: 'Name...',
                    ),
                    onChanged: (val) {
                      _email = val;
                    },
                  ),
                  TextFormField(
                    initialValue: '${_dob.toLocal()}'.split(' ')[0],
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Birthday',
                      hintText: 'Name...',
                    ),
                    onTap: () {
                      selectDate(context);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      'Save Changes',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          );
  }
}
