import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/services/auth.dart';

class AuthForm extends StatefulWidget {
  final String formType;
  AuthForm({Key key, @required this.formType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final AuthService _auth = AuthService();

  // define initial states
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          TextFormField(
            onChanged: (value) {
              setState(() => email = value);
            },
          ),
          SizedBox(height: 10.0),
          TextFormField(
            obscureText: true,
            onChanged: (value) {
              setState(() => password = value);
            },
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              widget.formType,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              print(widget.formType);
              print(email);
              print(password);
            },
          ),
          SizedBox(height: 20.0),
          if (widget.formType == "Sign In")
              RaisedButton(
              child: Text("Sign in Anon"),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();

                if (result == null) {
                  print("Sign In failed");
                } else {
                  print(widget.formType);
                  print(result.uid);
                }
              },
            ),
        ],
      ),
    );
  }
}
