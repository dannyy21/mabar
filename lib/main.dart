import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tugas/pages/LoginScreen.dart';
import 'package:tugas/pages/RegisterScreen.dart';
import 'package:tugas/pages/SplashScreen.dart';
import 'package:tugas/providers/Players.dart';
import 'package:tugas/routes/page_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        // create: (context) => Players(),
        // child:
        GetMaterialApp(
            home: SplashScreen(),
            getPages: pageRouteApp.pages,
            debugShowCheckedModeBanner: false);
    // );
  }
}
