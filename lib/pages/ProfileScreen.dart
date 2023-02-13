import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/HistoryScreen.dart';
import 'package:tugas/pages/LoginScreen.dart';
import 'package:tugas/pages/MyProfileScreen.dart';
import 'package:tugas/pages/SearchPlayer.dart';
import 'package:tugas/pages/TeamScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? fullname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff2A0D2E),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 40, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/images/CloseIc.png',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 50),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 60,
                        width: 60,
                        child: ClipOval(
                            child: Image.asset(
                          'assets/images/Photo.png',
                          fit: BoxFit.cover,
                        ))),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff08F403),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: _fetch(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState != ConnectionState.done)
                            return Text("Loading");
                          return Text(
                            fullname!,
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      Text(
                        "Gold Player",
                        style:
                            TextStyle(color: Color(0xFFF4C73E), fontSize: 10),
                      ),
                      Text(
                        "Online",
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 400,
            width: 200,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Color(0xFFFA5075),
                  ),
                  title: Text(
                    "My Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProfileScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.history,
                    color: Color(0xFFFA5075),
                  ),
                  title: Text(
                    "History",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Color(0xFFFA5075),
                  ),
                  title: Text(
                    "Players",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPlayer()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.group_work,
                    color: Color(0xFFFA5075),
                  ),
                  title: Text(
                    "Teams",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeamScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xFFFA5075),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        fullname = ds.data()!['fullname'] ?? '';
        // print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }
}
