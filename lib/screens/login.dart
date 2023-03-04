import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project/screens/bottombar.dart';
import 'package:project/screens/signup.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool passenable = true;
  final _auth = FirebaseAuth.instance;
  late String email, password;

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
                        )),
                  ),
                ),
                const Gap(40),
                Text("Login into your account", style: TextStyle()),
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
                        textAlign: TextAlign.left,
                        onChanged: (value) {
                          email = value; //get the value entered by user.
                        },
                        decoration: const InputDecoration(
                            hintText: "Email",
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
                      onChanged: (value) {
                        password = value;
                      },
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
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 15,
                  ),
                  child: InkWell(
                    onTap: () async {
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        print(newUser.toString());

                        if (newUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bottambar(),
                              ));
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
                        "login",
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
                    "dont have an account",
                    style: TextStyle(),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text("signup",
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
