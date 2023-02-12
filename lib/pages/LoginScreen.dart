import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas/pages/BottomBar.dart';
import 'package:tugas/pages/RegisterScreen.dart';
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
        body: Container(
      color: Color(0xff2A0D2E),
      child: Container(
        // padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/loginscreen.png',
              ),
            ),
            Container(
                // alignment: Alignment.center,
                // padding: EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 40),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ))),

            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _emailController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFA5075),
                      width: 1,
                    ),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFA5075),
                      width: 1,
                    ),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(21),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  child: Text('Forgot Password?',
                      style: TextStyle(color: Colors.white)),
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
                          MaterialPageRoute(
                              builder: (context) => BottomBar())));
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
              child: Center(
                  child: Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.white),
              )),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      // fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFA5075)),
                ),
              ),
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
