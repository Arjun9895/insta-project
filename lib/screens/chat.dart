import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("TeMPuZ"),
      actions: <Widget>[
        IconButton(
          icon: Icon(FluentSystemIcons.ic_fluent_camera_add_filled),
          onPressed: () {},
        )
      ],
    ));
  }
}
