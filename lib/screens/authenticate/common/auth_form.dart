import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/services/auth.dart';
import 'package:flutter_firebaselogin/shared/constants.dart';
import 'package:flutter_firebaselogin/shared/loading.dart';

class AuthForm extends StatefulWidget {
  final String formType;
  AuthForm({Key key, @required this.formType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // define initial states
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  Widget _buildEmail() {
    return TextFormField(
      validator: (value) => value.isEmpty ? 'Enter an Email' : null,
      decoration: textInputDecoration.copyWith(hintText: "Email"),
      onChanged: (value) {
        setState(() => email = value);
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      validator: (value) =>
          value.length < 6 ? 'Enter an password 6+ chars long' : null,
      decoration: textInputDecoration.copyWith(hintText: "Password"),
      obscureText: true,
      onChanged: (value) {
        setState(() => password = value);
      },
    );
  }

  Widget _buildSignInAnonBtn() {
    if (widget.formType == "Sign In") {
      return RaisedButton(
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
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildSignInEmailPassBtn() {
    return RaisedButton(
      color: Colors.pink[400],
      child: Text(
        widget.formType,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () async {
        dynamic result;
        setState(() => loading = true);

        if (widget.formType == "Register" && _formKey.currentState.validate()) {
          result = await _auth.registerWithEmailPass(email, password);
        } else {
          result = await _auth.signInEmailPass(email, password);
        }

        // if result is a String ==> Error
        if (result is String) {
          setState(() => loading = false);
          setState(() => error = result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          _buildEmail(),
          SizedBox(height: 20.0),
          _buildPassword(),
          SizedBox(height: 30.0),
          _buildSignInEmailPassBtn(),
          SizedBox(height: 20.0),
          _buildSignInAnonBtn(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            error,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
