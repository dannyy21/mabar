import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/Publish.dart';
import 'package:tugas/services/Players.dart';

class SearchPlayer extends StatefulWidget {
  const SearchPlayer({super.key});

  @override
  State<SearchPlayer> createState() => _SearchPlayerState();
}

class _SearchPlayerState extends State<SearchPlayer> {
  String? _selectedCategory;
  String? _selectedLocation;
  String? _selectedRole;
  late String? myUsername;
  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      var ds = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();
      myUsername = ds.data()!['username'] ?? '';
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _gamename = TextEditingController();
  final _category = TextEditingController();
  final _location = TextEditingController();
  final _role = TextEditingController();
  final _numberplayer = TextEditingController();
  final _description = TextEditingController();
  void _submit() async {
    var user = _fetch();
    if (_formKey.currentState?.validate() ?? false) {
      int number = int.parse(_numberplayer.text);
      try {
        PlayerManagement().storeNewPlayer(
            context,
            _gamename.text,
            _category.text,
            _location.text,
            _role.text,
            number,
            _description.text,
            myUsername!);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Color(0xff2A0D2E),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 20),
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
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Cari Teman Bermain',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFA5075),
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama Game",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                      controller: _gamename,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    // RaisedButton(
                    //   onPressed: _submit,
                    //   child: Text('Submit'),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: "Select an option",
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: _selectedCategory,
                items: [
                  DropdownMenuItem(
                    child: Text("MOBA"),
                    value: "MOBA",
                  ),
                  DropdownMenuItem(
                    child: Text("FPS"),
                    value: "2",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                    _category.text = value.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: "Select an option",
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: _selectedLocation,
                items: [
                  DropdownMenuItem(
                    child: Text("Bandung"),
                    value: "Bandung",
                  ),
                  DropdownMenuItem(
                    child: Text("Cimahi"),
                    value: "Cimahi",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedLocation = value;
                    _location.text = value.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "Role",
                    style: TextStyle(
                      color: Color(0xFFFA5075),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: _selectedRole,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Marksman",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: "Marksman",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Fighter",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: "Fighter",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Assassin",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: "Assassin",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value;
                        _role.text = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Number of Players",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    controller: _numberplayer,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  // RaisedButton(
                  //   onPressed: _submit,
                  //   child: Text('Submit'),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    controller: _description,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  // RaisedButton(
                  //   onPressed: _submit,
                  //   child: Text('Submit'),
                  // ),
                ],
              ),
            ),
            // Container(
            //   height: 65,
            //   padding: EdgeInsets.only(right: 70, left: 70),
            //   child: ElevatedButton(
            //       style: raisedButtonStyle,
            //       child: Text(
            //         "Let's Combat!",
            //         style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            //       ),
            //       onPressed: () {}),
            // ),
            Container(
              height: 75,
              width: 350,
              padding: EdgeInsets.only(right: 70, left: 70, top: 20),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed:
                    // () => {
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) => (Publish())))
                    _submit,
                // },
                child: Text(
                  'Publish',
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
