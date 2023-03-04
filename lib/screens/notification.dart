import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/screens/chat.dart';
import 'package:project/screens/notifi.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Notification"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FluentSystemIcons.ic_fluent_chat_filled),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chatpage()));
            },
          ),
        ],
      ),
    );
  }
}
