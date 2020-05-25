import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/screens/authenticate/common/auth_form.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key key, this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AuthForm(formType: "Sign In"),
      ),
    );
  }
}
