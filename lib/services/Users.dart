import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas/pages/BottomBar.dart';

import 'package:tugas/pages/HomeScreen.dart';

class UserManagement {
  storeNewUser(user, context, String username, String fullname,
      String phonenumber) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set({
          'email': user.email,
          'uid': user.uid,
          'username': username,
          'fullname': fullname,
          'phonenumber': phonenumber
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomBar())))
        .catchError((e) {
          print(e);
        });
  }
}
