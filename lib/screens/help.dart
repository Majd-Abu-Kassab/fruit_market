import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff69A03A),
          title: Text("Help".tr()),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                " To reset your password: \n Go to the login screen.\n Click 'Forgot Password'.\n Enter your email and submit.\n Check your inbox/spam folders.".tr(),
                style: TextStyle(fontSize: 19),
              ),
            ),
          ],
        ));
  }
}
