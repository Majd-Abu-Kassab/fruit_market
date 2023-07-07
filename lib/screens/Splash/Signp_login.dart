import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import '../../Login_Signup/sign_in_page.dart';
import '../../Login_Signup/sign_up_page.dart';

class SLPage extends StatefulWidget {
  const SLPage({Key? key}) : super(key: key);

  @override
  State<SLPage> createState() => _SLPageState();
}

class _SLPageState extends State<SLPage> {
  String Lang = 'EN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            if (Lang == 'EN') {
                              Lang = 'Ar';

                              // Perform actions for switching to 'Ar' language
                              EasyLocalization.of(context)!.setLocale(Locale('ar', 'DZ'));
                            } else {
                              Lang = 'EN';

                              // Perform actions for switching to 'EN' language
                              EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
                            }

                          });
                        },
                        child: Text(
                          "${Lang}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/play_store_512.png',
                        width: 240,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: const Text(
                      'Fruit Market',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff69A03A)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 18)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignInPage()),
                          );
                        },
                        child: Text('Sign in'.tr()),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff3a6aa0)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 18)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignUp()),
                          );
                        },
                        child: Text('Create account'.tr()),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
