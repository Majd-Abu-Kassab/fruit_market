import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotSetting extends StatefulWidget {
  const NotSetting({super.key});

  @override
  State<NotSetting> createState() => _NotSettingState();
}

class _NotSettingState extends State<NotSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Settings"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              //
            },
            leading: Icon(
              Icons.notifications,
              color: Colors.amber,
            ),
            title: Text(
              "My Account",
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            subtitle: Text("You will receive daily updates"),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              //
            },
            leading: Icon(
              Icons.notifications,
              color: Colors.amber,
            ),
            title: Text(
              "Pramotional Notifications",
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            subtitle: Text("You will receive daily updates"),
          ),
        ],
      ),
    );
  }
}
