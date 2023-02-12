import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas/pages/BottomBar.dart';

import 'package:tugas/pages/HomeScreen.dart';
import 'package:tugas/pages/Publish.dart';

class PlayerManagement {
  storeNewPlayer(
      context,
      String _gamename,
      String _category,
      String _location,
      String _role,
      int _numberplayer,
      String _description,
      String myUsername) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('players')
        .doc(firebaseUser?.uid)
        .set({
          'gamename': _gamename,
          'category': _category,
          'location': _location,
          'role': _role,
          'numberplayer': _numberplayer,
          'description': _description,
          'username': myUsername
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Publish())))
        .catchError((e) {
          print(e);
        });
  }
}
