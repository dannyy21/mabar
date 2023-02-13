import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/HomeScreen.dart';
import 'package:tugas/pages/Join.dart';
import 'package:tugas/pages/PlayerInformation.dart';

class TeamDetailScreen extends StatefulWidget {
  final String gamename;
  final String role;
  final String username;
  final String description;
  final String category;
  final String location;
  TeamDetailScreen({
    required this.gamename,
    required this.role,
    required this.username,
    required this.description,
    required this.category,
    required this.location,
  });
  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff2A0D2E),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 5),
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
              padding: const EdgeInsets.only(left: 30, bottom: 30),
              child: Row(
                children: [
                  Text(
                    "Informasi \nTeam",
                    style: TextStyle(
                        color: Color(0xFFFA5075),
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFFA5075),
                  width: 2.0, // width of the border
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xFFFF6480),
                //     Color(0xFFF22E63),
                //   ],
                // ),
                // color: Colors.white,
                // border: Border.all(color: Colors.red),
              ),
              height: 300,
              width: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.gamename,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Rank",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlayerInformation()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: Column(
                                  children: [
                                    // Stack(
                                    //   children: [
                                    //     Image.asset(
                                    //       'assets/images/Photo.png',
                                    //       width: 40,
                                    //       height: 40,
                                    //       fit: BoxFit.fill,
                                    //     ),
                                    //     Container(
                                    //       // width: double.infinity,
                                    //       // height: double.infinity,
                                    //       decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(10)),
                                    //         gradient: LinearGradient(
                                    //           begin: Alignment.topLeft,
                                    //           end: Alignment.bottomRight,
                                    //           colors: [
                                    //             Color(0xFFFF6480),
                                    //             Color(0xFFF22E63),
                                    //           ],
                                    //         ),
                                    //         color: Colors.white,
                                    //         // border: Border.all(color: Colors.red),
                                    //       ),
                                    //       child: Text(
                                    //         widget.role,
                                    //         style:
                                    //             TextStyle(color: Colors.white),
                                    //       ),
                                    //       alignment: Alignment.topLeft,
                                    //       // foregroundDecoration: BoxDecoration(
                                    //       //   border: Border.all(color: Colors.red),
                                    //       // ),
                                    //     ),
                                    //   ],
                                    // ),

                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Container(
                                              height: 35,
                                              width: 35,
                                              child: ClipOval(
                                                  child: Image.asset(
                                                'assets/images/Photo.png',
                                                // fit: BoxFit.cover,
                                              ))),
                                        ),
                                        Positioned(
                                          top: 5,
                                          left: 0,
                                          child: Container(
                                            child: Text(
                                              widget.role,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            width: 35,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFFFF6480),
                                                  Color(0xFFF22E63),
                                                ],
                                              ),
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        widget.username,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "DESCRIPTION",
                        style:
                            TextStyle(color: Color(0xFFFA5075), fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.description,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "CATEGORY",
                          style:
                              TextStyle(color: Color(0xFFFA5075), fontSize: 12),
                        ),
                        Text(
                          widget.category,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "LOCATION",
                          style:
                              TextStyle(color: Color(0xFFFA5075), fontSize: 12),
                        ),
                        Text(
                          widget.location,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 75,
              width: 350,
              padding: EdgeInsets.only(right: 70, left: 70, top: 20),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () => {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => (Join())))
                },
                child: Text(
                  'Join Team !',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
  primary: Color(0xFFFA5075),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
);
