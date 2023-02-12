import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/models/Players.dart';
import 'package:tugas/pages/BottomBar.dart';
import 'package:tugas/pages/TeamDetailScreen.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  // String? _gameName;
  // String? _location;
  // String? _description;
  // String? _role;
  // String? _category;
  List<Players> PlayersItem = [];
  @override
  void initState() {
    // TODO: implement initState
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var records = await FirebaseFirestore.instance.collection('players').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map((item) => Players(
            category: item['category'],
            description: item['description'],
            gamename: item['gamename'],
            location: item['location'],
            numberplayer: item['numberplayer'],
            role: item['role']))
        .toList();
    setState(() {
      PlayersItem = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scaffold(
              body: Stack(
            children: [
              // First Stack
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFF6480),
                        Color(0xFFF22E63),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 5),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 19),
                        child: Row(
                          children: [
                            Text(
                              "TEAM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Second Stack
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Container(
                  color: Color(0xff2A0D2E),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Trending this week",
                              style: TextStyle(
                                  color: Color(0xFFFA5075),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Text(
                              "View All",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FutureBuilder(
                    //   future: _fetch(),
                    //   builder: (context, snapshot) {
                    // var game = snapshot.data!['gamename'];
                    // if (!snapshot.hasData) {
                    //   return CircularProgressIndicator();
                    // }
                    // List<DocumentSnapshot> players = snapshot.data!.docs;
                    Expanded(
                      child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection("players")
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot data =
                                    snapshot.data!.docs[index];
                                // return ListTile(
                                //   title: Text(data["role"]),
                                // );
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeamDetailScreen(
                                                  gamename: data["gamename"],
                                                  role: data["role"],
                                                  username: data["username"],
                                                  description:
                                                      data["description"],
                                                  category: data["category"],
                                                  location: data["location"],
                                                )));
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Container(
                                                  height: 90,
                                                  width: 370,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color(0xFFFA5075),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            width: 160,
                                                            child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Stack(
                                                                          children: [
                                                                            Image.asset(
                                                                              'assets/images/Photo.png',
                                                                              width: 40,
                                                                              height: 40,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                            Container(
                                                                              width: 40,
                                                                              height: 15,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                gradient: LinearGradient(
                                                                                  begin: Alignment.topLeft,
                                                                                  end: Alignment.bottomRight,
                                                                                  colors: [
                                                                                    Color(0xFFFF6480),
                                                                                    Color(0xFFF22E63),
                                                                                  ],
                                                                                ),
                                                                                color: Colors.white,
                                                                                // border: Border.all(color: Colors.red),
                                                                              ),
                                                                              child: Text(
                                                                                data['role'],
                                                                                style: TextStyle(color: Colors.white, fontSize: 10),
                                                                              ),
                                                                              alignment: Alignment.topLeft,
                                                                              // foregroundDecoration: BoxDecoration(
                                                                              //   border: Border.all(color: Colors.red),
                                                                              // ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          data[
                                                                              "username"],
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 10),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ]),
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          Row(children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      top: 30),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "Game Name",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  Text(
                                                                    data[
                                                                        "gamename"],
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFFA5075),
                                                                        fontSize:
                                                                            10),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      top: 30),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "Status",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  Text(
                                                                    "Active",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .green,
                                                                        fontSize:
                                                                            10),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 20,
                                                                      top: 30),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "Winning Rate",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                  Text(
                                                                    "100%",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFFA5075),
                                                                        fontSize:
                                                                            10),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ]),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    // Expanded(
                    //   // height: 100,
                    //   child: ListView.builder(
                    //       itemCount: PlayersItem.length,
                    //       itemBuilder: (context, index) {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         TeamDetailScreen()));
                    //           },
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Column(
                    //                 children: [
                    //                   Row(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.center,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       Container(
                    //                         height: 90,
                    //                         width: 370,
                    //                         decoration: BoxDecoration(
                    //                           borderRadius:
                    //                               BorderRadius.circular(10),
                    //                           border: Border.all(
                    //                             color: Color(0xFFFA5075),
                    //                             width: 2.0,
                    //                           ),
                    //                         ),
                    //                         child: Row(
                    //                           children: [
                    //                             Column(
                    //                               children: [
                    //                                 Container(
                    //                                   width: 200,
                    //                                   child: Row(children: [
                    //                                     Padding(
                    //                                       padding:
                    //                                           const EdgeInsets
                    //                                               .all(10.0),
                    //                                       child: Column(
                    //                                         children: [
                    //                                           Stack(
                    //                                             children: [
                    //                                               Image.asset(
                    //                                                 'assets/images/Photo.png',
                    //                                                 width: 40,
                    //                                                 height: 40,
                    //                                                 fit: BoxFit
                    //                                                     .fill,
                    //                                               ),
                    //                                               Container(
                    //                                                 width: 40,
                    //                                                 height: 15,
                    //                                                 decoration:
                    //                                                     BoxDecoration(
                    //                                                   borderRadius:
                    //                                                       BorderRadius.all(
                    //                                                           Radius.circular(10)),
                    //                                                   gradient:
                    //                                                       LinearGradient(
                    //                                                     begin: Alignment
                    //                                                         .topLeft,
                    //                                                     end: Alignment
                    //                                                         .bottomRight,
                    //                                                     colors: [
                    //                                                       Color(
                    //                                                           0xFFFF6480),
                    //                                                       Color(
                    //                                                           0xFFF22E63),
                    //                                                     ],
                    //                                                   ),
                    //                                                   color: Colors
                    //                                                       .white,
                    //                                                   // border: Border.all(color: Colors.red),
                    //                                                 ),
                    //                                                 child: Text(
                    //                                                   "MM",
                    //                                                   style: TextStyle(
                    //                                                       color:
                    //                                                           Colors.white),
                    //                                                 ),
                    //                                                 alignment:
                    //                                                     Alignment
                    //                                                         .topLeft,
                    //                                                 // foregroundDecoration: BoxDecoration(
                    //                                                 //   border: Border.all(color: Colors.red),
                    //                                                 // ),
                    //                                               ),
                    //                                             ],
                    //                                           ),
                    //                                           Text(
                    //                                             "Name",
                    //                                             style: TextStyle(
                    //                                                 color: Colors
                    //                                                     .white),
                    //                                           )
                    //                                         ],
                    //                                       ),
                    //                                     ),
                    //                                   ]),
                    //                                 )
                    //                               ],
                    //                             ),
                    //                             Column(
                    //                               children: [
                    //                                 Row(children: [
                    //                                   Column(
                    //                                     children: [
                    //                                       Text(
                    //                                         "Game Name",
                    //                                         style: TextStyle(
                    //                                             color: Colors
                    //                                                 .white,
                    //                                             fontSize: 10),
                    //                                       ),
                    //                                       Text(
                    //                                         // PlayersItem[index]
                    //                                         //     .gamename,
                    //                                         "",
                    //                                         style: TextStyle(
                    //                                             color: Colors
                    //                                                 .white,
                    //                                             fontSize: 10),
                    //                                       )
                    //                                     ],
                    //                                   ),
                    //                                   Column(
                    //                                     children: [
                    //                                       Text("Status"),
                    //                                       Text("Active")
                    //                                     ],
                    //                                   ),
                    //                                   Column(
                    //                                     children: [
                    //                                       Text("Winning Rate"),
                    //                                       Text("89%")
                    //                                     ],
                    //                                   )
                    //                                 ]),
                    //                               ],
                    //                             )
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Most Popular Players",
                              style: TextStyle(
                                  color: Color(0xFFFA5075),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Text(
                              "View All",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80,
                                width: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFFA5075),
                                    width: 3.0,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/Photo.png',
                                          width: 55,
                                          height: 55,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("KillMe"),
                                        Text("KillMe"),
                                        Text("KillMe"),
                                        Text("KillMe")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 80,
                                width: 170,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFFA5075),
                                    width: 3.0,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/Photo.png',
                                          width: 55,
                                          height: 55,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("KillMe"),
                                        Text("KillMe"),
                                        Text("KillMe"),
                                        Text("KillMe")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ],
          )),
        ),
        // Expanded(
        //   child: Scaffold(
        //     body: Stack(
        //       children: [
        //         Positioned(
        //           left: 0,
        //           right: 0,
        //           top: 0.5 * MediaQuery.of(context).size.height,
        //           bottom: 0,
        //           child: Container(
        //             color: Colors.blue,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  // _fetch() async {
  //   final firebaseUser = FirebaseAuth.instance.currentUser;
  //   if (firebaseUser != null)
  //     await FirebaseFirestore.instance
  //         .collection('players')
  //         .doc(firebaseUser.uid)
  //         .get()
  //         .then((ds) {
  //       _gameName = ds.data()!['gamename'] ?? '';
  //       _location = ds.data()!['location'] ?? '';
  //       _description = ds.data()!['description'] ?? '';
  //       _role = ds.data()!['role'] ?? '';
  //       _category = ds.data()!['category'] ?? '';
  //     }).catchError((e) {
  //       print(e);
  //     });
  // }
}
