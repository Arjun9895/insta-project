import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/chat.dart';
import 'package:project/screens/post.dart';
import 'package:project/screens/story.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("TeMPuZ"),
          actions: <Widget>[
            IconButton(
              icon: Icon(FluentSystemIcons.ic_fluent_chat_filled),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Chatpage())));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: double.infinity,
                height: 80,
                color: Colors.black,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      children: List.generate(50, (index) => Storypage()),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: Column(
                  children: List.generate(50, (index) => Post()),
                ))
          ]),
        ));
  }
}
