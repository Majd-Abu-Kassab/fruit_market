import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restart_app/restart_app.dart';

class LangSetting extends StatefulWidget {
  const LangSetting({super.key});

  @override
  State<LangSetting> createState() => _LangSettingState();
}

class _LangSettingState extends State<LangSetting> {

  String Lang = 'English'.tr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        title: Text("Language Setting".tr()),
      ),
      body: Column(children: [

        ListTile(
          onTap: () {
            log(EasyLocalization.of(context)!.currentLocale.toString()) ;
            if (Lang == 'English'.tr()) {
              Lang = 'Arabic'.tr();

              // Perform actions for switching to 'Ar' language
              EasyLocalization.of(context)!.setLocale(Locale('ar', 'DZ'));
            } else {
              Lang = 'English'.tr();

              // Perform actions for switching to 'EN' language
              EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));

            }
          },
          trailing: Icon(
            Icons.arrow_forward,
          ),
          title: Text(
            "Language".tr(),
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          subtitle: Text("${Lang}".tr()),
        ),
      ]),
      // GestureDetector(
      //   onTap: (){
      //     setState(() {
      //
      //
      //     });
      //   },
      //   child: Text(
      //     "${Lang}",
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}
