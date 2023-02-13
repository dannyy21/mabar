import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? myUsername;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff2A0D2E),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFFA5075),
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Color(0xFFFA5075),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFFA5075),
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                                height: 60,
                                width: 60,
                                child: ClipOval(
                                    child: Image.asset(
                                  'assets/images/Photo.png',
                                  fit: BoxFit.cover,
                                ))),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
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
                        padding: const EdgeInsets.all(5.0),
                        child: FutureBuilder(
                          future: _fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done)
                              return Text("Loading data...Please wait");
                            return Text(
                              myUsername!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            );
                          },
                        ),
                        // Text(
                        //   "FahryFar",
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w700),
                        // ),
                      ),
                      Text(
                        "Online",
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text("Rank:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text("Legend",
                                    style: TextStyle(
                                        color: Color(
                                          0xFFFA5075,
                                        ),
                                        fontSize: 12))
                              ],
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text("Role:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text("Marksman",
                                    style: TextStyle(
                                        color: Color(
                                          0xFFFA5075,
                                        ),
                                        fontSize: 12))
                              ],
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 35,
                            // decoration: BoxDecoration(
                            //   border: Border(
                            //     right: BorderSide(
                            //       color: Colors.white,
                            //       width: 1,
                            //     ),
                            //   ),
                            // ),
                            child: Column(
                              children: [
                                Text("Win rate:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Text("100%",
                                    style: TextStyle(
                                        color: Color(
                                          0xFFFA5075,
                                        ),
                                        fontSize: 12))
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "BIO",
                                style: TextStyle(
                                    color: Color(
                                      0xFFFA5075,
                                    ),
                                    fontSize: 12),
                              ),
                              Text(
                                "Halo Saya Player berasal dari Cimahi",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "Gold Player",
                                  style: TextStyle(
                                      color: Color(0xFFF4C73E), fontSize: 10),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "CATEGORY",
                        style: TextStyle(
                            color: Color(
                              0xFFFA5075,
                            ),
                            fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFFA5075),
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 30,
                              width: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "MOBA",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Row(),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "LOCATION",
                        style: TextStyle(
                            color: Color(
                              0xFFFA5075,
                            ),
                            fontSize: 12),
                      ),
                      Text(
                        "Cimahi",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
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
        myUsername = ds.data()!['username'] ?? '';

        // print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }
}
