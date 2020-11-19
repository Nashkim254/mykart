
import 'package:flutter/material.dart';
import 'package:mykart/widgets/login.dart';
import 'package:mykart/widgets/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleView);
    } else {
      return Signup(toggleView);
    }
  }
}