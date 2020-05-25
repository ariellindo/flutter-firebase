import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
