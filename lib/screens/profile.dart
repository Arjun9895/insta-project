import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Profile"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()));
              },
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: firestore.collection("user").doc(uid).get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Something went Wrong");
                  }
                  debugPrint(snapshot.data.data().toString());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment(0.0, 2.5),
                              child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      snapshot.data.data()["Image"]),
                                  radius: 60.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              snapshot.data.data()["Name"],
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Followers",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                        snapshot.data
                                            .data()["Follower"]
                                            .toString(),
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Following",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      snapshot.data
                                          .data()["Following"]
                                          .toString(),
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.grey, Colors.black]),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 100.0,
                                      maxHeight: 40.0,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Posts",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.grey, Colors.black]),
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 100.0,
                                      maxHeight: 40.0,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Tag",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ));
  }
}
