import 'package:flutter/material.dart';
import 'package:flutter_firebaselogin/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        title: Text('Sign in')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0),
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter email"),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              SizedBox(height: 10.0),
              // RaisedButton(
              //     child: Text("Login"),
              //     onPressed: () async {
              //       if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
              //         print("Email and password can't be empty");
              //       }
              //       bool res = await AuthService().signInEmailPass(_emailController.text, _passwordController.text);
              //       if(res){
              //         print("Login failed");
              //       }
              //     })

              RaisedButton(
                child: Text("Sign in Anon"),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();

                  if(result == null) {
                    print("Login failed");
                  } else {
                    print("Sign in");
                    print(result.uid);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
