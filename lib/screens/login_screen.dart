import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mycycles/screens/home_screen.dart';
import 'package:mycycles/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum FormType { login, register }

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService = AuthService();
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _gender;
  FormType _formType = FormType.login;

  @override
  void initState() {
    super.initState();
    authService.getCurrentUser.then((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      }
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<FirebaseUser> validateAndSubmit() async {
    FirebaseUser user;
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          user = await authService.signIn(_email, _password);
          print('Signed in: ${user.email}');
        } else {
          user = await authService.signUp(_email, _password);
          print('Registered: ${user.email}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
    return user;
  }

  void moveToRegister() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new SizedBox(
                height: 48.0,
              ),
              new Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs() + buildSubmitButtons(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets
  List<Widget> buildInputs() {
    if (_formType == FormType.login) {
      return <Widget>[
        TextFormField(
          key: Key('email'),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Email',
          ),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Password',
          ),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
      ];
    } else {
      return <Widget>[
        TextFormField(
          key: Key('email'),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Email',
          ),
          validator: EmailFieldValidator.validate,
          onSaved: (String value) => _email = value,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (String value) => _password = value,
        ),
        DropdownButton(
          hint: Text('Gender'),
          value: _gender,
          isExpanded: true,
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
      ];
    }
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return <Widget>[
        RaisedButton(
          key: Key('signIn'),
          color: Colors.redAccent,
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: () async {
            var user = await validateAndSubmit();
            if (user != null) {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            }
          },
        ),
        LoginButton(
          text: 'LOGIN WITH FACEBOOK',
          icon: FontAwesomeIcons.facebook,
          color: Colors.black45,
          loginMethod: authService.facebookSignIn,
        ),
        FlatButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return <Widget>[
        RaisedButton(
          color: Colors.redAccent,
          child: Text(
            'Create an account',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          onPressed: () async {
            var user = await validateAndSubmit();
            if (user != null) {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            }
          },
        ),
        FlatButton(
          child: Text('Have an account? Login', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton({Key key, this.color, this.icon, this.text, this.loginMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}
