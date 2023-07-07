import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccSetting extends StatefulWidget {
  const AccSetting({super.key});

  @override
  State<AccSetting> createState() => _AccSettingState();
}

class _AccSettingState extends State<AccSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Settings"),
        backgroundColor: Color(0xff69A03A),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              //
            },
            leading: Icon(
              Icons.security,
              color: Color(0xff69A03A),
            ),
            title: Text("Security"),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              //
            },
            leading: Icon(
              Icons.no_accounts,
              color: Color(0xff69A03A),
            ),
            title: Text("Deactivate Account"),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              //
            },
            leading: Icon(
              Icons.delete,
              color: Color(0xff69A03A),
            ),
            title: Text("Delete Account"),
          ),
        ],
      ),
    );
  }
}
