import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/screens/login.dart';

class startup extends StatelessWidget {
  const startup({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () {
        Get.to(Loginpage());
      },
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          height: 200,
          width: 200,
          child: Center(child: Text("Tempuz")),
        )));
  }
}
