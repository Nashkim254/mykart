import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
    final Function toggleView;
  Signup(this.toggleView);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _signKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  singUp() async {
    if (_signKey.currentState.validate()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passController.text)
          .then((result) {
        if (result != null) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(result.user.uid)
              .set({
            "uid": result.user.uid,
            "userName": usernameController.text,
            "userEmail": result.user.email,
          }).catchError((e) {
            print(e);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            Spacer(),
            Form(
              key: _signKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: usernameController,
                    validator: (val) {
                      return val.isEmpty || val.length < 3
                          ? "Enter Username 3+ characters"
                          : null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter username here',
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    validator: (val) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)
                          ? null
                          : "Enter correct email";
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter email here',
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    validator: (val) {
                      return val.length < 6
                          ? "Enter Password 6+ characters"
                          : null;
                    },
                    controller: passController,
                    decoration: InputDecoration(
                        hintText: 'Enter password here', labelText: 'Password'),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      singUp();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff007EF4),
                              const Color(0xff2A75BC)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.mcLaren(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "SignIn now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
