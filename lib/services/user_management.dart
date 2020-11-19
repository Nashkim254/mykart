import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mykart/widgets/sales_person.dart';

class UserManagement {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  UserManagement({this.auth, this.firestore});
    authorizeAccess(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user) { 
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: user.uid)
          .get()
          .then((docums) {
        if (docums.docs[0].exists) {
          if (docums.docs[0].data()['role'] == 'admin') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Sales()));
          } else {
            alert(context);
          }
        }
      });
    });
  }
  void alert(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text('Not Authorized'),
        content: Text('You\'re not an admin!'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Alright',
              style: TextStyle(color: Colors.green, fontSize: 15.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

}