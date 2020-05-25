import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/screens/authenticate/authenticate.dart';
import 'package:flutter_firebaselogin/screens/home/home.dart';
import 'package:flutter_firebaselogin/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    print(user);

    // reutnrs the authenticate widget or home widget

    if( user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
