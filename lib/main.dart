import 'package:flutter/material.dart';
import 'package:project/screens/bottombar.dart';
import 'package:project/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/screens/profile.dart';

import 'package:project/screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Loginpage(),
    );
  }
}
