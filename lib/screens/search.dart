import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _Searchpage();
}

class _Searchpage extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Explore"),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextField(
              decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: "search for an account",
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )),
        ),
      ),
    );
  }
}
