import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/login.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Settings"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.help_center_outlined),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginpage(),
                ));
          },
        ),
      ],
    ));
    ;
  }
}
