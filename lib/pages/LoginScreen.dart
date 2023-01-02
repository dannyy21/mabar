import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/loginscreen.png',
            ),
          ),
          Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back !",
                        style: TextStyle(
                            color: Color(0xFFFA5075),
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                      Text(
                        "Hi, Kindly login to continue battle",
                        style: TextStyle(
                            color: Color(0xFFFA5075),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ))),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(
          //     "assets/img/flutter.png",
          //     height: 100,
          //     width: 100,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFA5075),
                      width: 1,
                    ),
                  ),
                  labelText: "Email"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFA5075),
                      width: 1,
                    ),
                  ),
                  labelText: "Password"),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(21),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text('Forgot Password'),
                onPressed: () {},
              ),
            ),
          ),
          Container(
            height: 65,
            padding: EdgeInsets.only(right: 70, left: 70),
            child: ElevatedButton(
              style: raisedButtonStyle,
              child: Text(
                "Let's Combat!",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
              onPressed: () async {
                await _firebaseAuth
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen())));
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //     height: 50,
          //     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //     child: ElevatedButton(
          //         style: raisedButtonStyle,
          //         child: Text("Register"),
          //         onPressed: () async {
          //           await _firebaseAuth.createUserWithEmailAndPassword(
          //               email: _emailController.text,
          //               password: _passwordController.text);
          //         })),
        ],
      ),
    ));
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
