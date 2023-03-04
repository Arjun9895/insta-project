import 'package:flutter/material.dart';
import 'package:project/screens/login.dart';
import 'package:project/main.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'bottombar.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;
  late String email, password;
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage("assets/images/logo.png")))),
                  ),
                ),
                const Gap(40),
                Text("Register your account", style: TextStyle()),
                const Gap(50),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 15,
                  ),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value; //get the value entered by user.
                        },
                        decoration: const InputDecoration(
                            hintText: "  Email",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(1),
                            hintStyle: TextStyle(height: 1))),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 15,
                  ),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: TextField(
                      obscureText: passenable,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Password",
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (passenable) {
                                    passenable = false;
                                  } else {
                                    passenable = true;
                                  }
                                });
                              },
                              icon: Icon(passenable == true
                                  ? Icons.remove_red_eye
                                  : Icons.password))),
                    ),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 15,
                  ),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        password = value; //get the value entered by user.
                      },
                      obscureText: passenable,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  ConfirmPassword",
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (passenable) {
                                    passenable = false;
                                  } else {
                                    passenable = true;
                                  }
                                });
                              },
                              icon: Icon(passenable == true
                                  ? Icons.remove_red_eye
                                  : Icons.password))),
                    ),
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 15,
                  ),
                  child: InkWell(
                    onTap: () async {
                      try {
                        final newuser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        if (newuser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()),
                          );
                        }
                      } catch (e) {}
                    },
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 13, 13, 17),
                            Color.fromARGB(153, 60, 60, 63),
                          ]),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                          ]),
                      child: const Text(
                        "signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(40),
                Center(
                  child: Text(
                    "already have an account?",
                    style: TextStyle(),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                    child: Text("login",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                )
              ]),
        )),
      ),
    );
  }
}
