import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/screens/authenticate/common/auth_form.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0.0,
          title: Text('Register'),
          actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("Sign In"),
          ),
        ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AuthForm(formType: "Register"),
        ),
      ),
    );
  }
}
