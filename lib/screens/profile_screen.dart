import 'package:flutter/material.dart';
import 'package:mycycles/common/loader.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  DateTime _dob = DateTime(DateTime.now().year - 29, DateTime.now().month, DateTime.now().day);
  String _email = 'junhuhdev@gmail.com';
  String _name = 'Jun Huh';
  String _gender = 'MALE';

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
      });
    }
    setState(() {
      isLoading = false;
    });
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
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.sentiment_satisfied),
                      labelText: 'Gender',
                      hintText: 'Select your gender',
                    ),
                    value: _gender,
                    isExpanded: true,
                    isDense: true,
                    items: ['MALE', 'FEMALE'].map((val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _gender = val;
                      });
                    },
                  ),
                  SizedBox(height: 40.0),
                  RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      'Save Changes',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text(
                      'Delete Account',
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
