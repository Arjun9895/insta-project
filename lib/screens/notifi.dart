import 'package:flutter/material.dart';

class Notifi extends StatelessWidget {
  const Notifi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: 50,
        width: double.infinity,
        color: Colors.grey,
        child: Text("A started following you"),
      ),
    ));
  }
}
