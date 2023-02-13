import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tugas/pages/Drawer.dart';
import 'package:tugas/pages/ProfileScreen.dart';
import 'package:tugas/pages/SearchPlayer.dart';
import 'package:tugas/pages/TeamScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../providers/Players.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? myUsername;

  // Uri url = Uri.parse('https://tugas-21f93.firebaseio.com/player.json');
  // http.post(url, body:json.encode({"id":datetimeNow.toString(),"name" :name}));
  // CollectionReference _referenceData =
  // FirebaseFirestore.instance.collection('player');
  // late Stream<QuerySnapshot> _streamData;
  @override
  // void initState() {
  //   super.initState();
  //   _streamData = _referenceData.snapshots();
  // }

  @override
  Widget build(BuildContext context) {
    // final allPlayerProvider = Provider.of<Players>(context);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xff301934),
        //   title: Expanded(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: <Widget>[
        //         CircleAvatar(
        //             backgroundImage: AssetImage('assets/images/fahri.jpg')),
        //         SizedBox(width: 10),
        //         Text("Stone Stellar"),
        //       ],
        //     ),
        //   ),
        // ),
        // drawer: DrawerScreen(),
        body:
            // StreamBuilder<QuerySnapshot>(
            //     stream: _streamData,
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.hasError) {
            //         return Center(child: Text(snapshot.error.toString()));
            //       }
            //       if (snapshot.connectionState == ConnectionState.active) {
            //         QuerySnapshot querySnapshot = snapshot.data;
            //       }
            //       return Center(child: CircularProgressIndicator());
            Container(
      color: Color(0xff2A0D2E),
      child: ListView(
        // itemBuilder: (context, index) {

        // }
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/Hamburger.png',
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: ClipOval(
                              child: Image.asset(
                            'assets/images/Photo.png',
                            fit: BoxFit.cover,
                          ))),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done)
                              return Text("Loading data...Please wait");
                            return Text(
                              myUsername!,
                              style: TextStyle(color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 189,
            width: double.maxFinite,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              // elevation: 5,
              color: const Color(0xff53183B),
              child: Row(
                children: [
                  Padding(
                    // width: double.infinity,
                    padding: EdgeInsets.only(left: 30, top: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 220,
                          child: Text(
                            'History',
                            style: TextStyle(
                                color: Color(0xFFFA5075),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 220,
                          child: Text(
                            'History Bermain Bersama Teman -\nTeman',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      child: Image.asset(
                        'assets/images/History.png',
                      ),
                    )
                  ])
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPlayer()),
              );
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 189,
              width: double.maxFinite,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                elevation: 5,
                color: Color(0xff53183B),
                child: Row(
                  children: [
                    Padding(
                      // width: double.infinity,
                      padding: EdgeInsets.only(left: 30, top: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 210,
                            child: Text(
                              'Player',
                              style: TextStyle(
                                  color: Color(0xFFFA5075),
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 210,
                            child: Text(
                              'Cari Teman Bermain mu',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      Container(
                        child: Image.asset(
                          'assets/images/Player.png',
                        ),
                      )
                    ])
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeamScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 189,
              width: double.maxFinite,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                elevation: 5,
                color: Color(0xff53183B),
                child: Row(
                  children: [
                    Padding(
                      // width: double.infinity,
                      padding: EdgeInsets.only(left: 30, top: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              'Team',
                              style: TextStyle(
                                  color: Color(0xFFFA5075),
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 120,
                            child: Text(
                              'Cari Team Terbaik mu',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      Container(
                        child: Image.asset(
                          'assets/images/Team.png',
                        ),
                      )
                    ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myUsername = ds.data()!['username'] ?? '';

        // print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }
}
