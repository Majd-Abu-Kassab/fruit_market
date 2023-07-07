import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'accSetting.dart';
import 'addresSetting.dart';
import 'langSetting.dart';
import 'notiSetting.dart';

class Sttings extends StatefulWidget {
  const Sttings({super.key});

  @override
  State<Sttings> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Sttings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".tr()),
        backgroundColor: Color(0xff69A03A),
      ),
      body: Column(
        children: [
          // ListTile(
          //   onTap: () {
          //     //
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) =>AccSetting()),
          //     );
          //   },
          //   leading: Icon(
          //     Icons.account_circle,
          //     color: Color(0xff69A03A),
          //   ),
          //   title: Text("Account".tr()),
          // ),
          // Divider(
          //   thickness: 2,
          // ),
          // ListTile(
          //   onTap: () {
          //     //
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => NotSetting()),
          //     );
          //   },
          //   leading: Icon(
          //     Icons.notifications,
          //     color: Color(0xff69A03A),
          //   ),
          //   title: Text("Notification"),
          // ),
          // Divider(
          //   thickness: 2,
          // ),
          ListTile(
            onTap: () {

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LangSetting()),
              );
            },
            leading: Icon(
              Icons.language,
              color: Color(0xff69A03A),
            ),
            title: Text("Language".tr()),
          ),

        ],
      ),
    );
  }
}
