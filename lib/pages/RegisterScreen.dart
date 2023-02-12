import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugas/pages/LoginScreen.dart';
import '../routes/routename.dart';
import '../services/Users.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        )
            .then((signedInUser) {
          UserManagement().storeNewUser(
              signedInUser.user,
              context,
              _usernameController.text,
              _fullnameController.text,
              _phoneNumberController.text);
        }).catchError((e) {
          print(e);
        }).catchError((e) {
          print(e);
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xff2A0D2E),
        child: ListView(children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/Register.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFA5075)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "Hi, kindly fill in the form to proceed combat",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _fullnameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a full name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      Container(
                        height: 75,
                        width: 350,
                        padding: EdgeInsets.only(right: 70, left: 70, top: 20),
                        child: ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: _submit,
                          child: Text(
                            'Create Account',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Center(
                          child: Text(
                            "Already Have Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFA5075)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
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
