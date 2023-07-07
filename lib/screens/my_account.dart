import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Screens/shopping_page.dart';

import 'package:fruit_market/screens/myAccountSetting/settings_acc.dart';
import '../Login_Signup/sign_in_page.dart';
import '../UserInfo/states.dart';
import 'AboutUS/about_us.dart';
import 'edit_profile.dart';
import 'help.dart';
import 'my_orders.dart';

class MyAccScreen extends StatefulWidget {
  const MyAccScreen({super.key});

  @override
  State<MyAccScreen> createState() => _MyAccScreenState();
}

class _MyAccScreenState extends State<MyAccScreen> {
  UserInformation info = new UserInformation();
  void initState() {
    super.initState();
    _getUserName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              icon: Icon(Icons.edit_document))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              color: Color(0xff69A03A),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/person.png"),
                      radius: 60,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Text(
                    info.Name.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    info.email.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyOrdersScreen()),
                );
              },
              leading: Icon(
                Icons.shopping_basket,
                color: Color(0xff69A03A),
              ),
              title: Text("My Orders".tr()),
            ),
            Divider(
              thickness: 2,
            ),

            ListTile(
              onTap: () {
                //
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Sttings()),
                );
              },
              leading: Icon(
                Icons.settings,
                color: Color(0xff69A03A),
              ),
              title: Text("Settings".tr()),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartShoppingPage()),
                );
              },
              leading: Icon(
                Icons.shopping_cart,
                color: Color(0xff69A03A),
              ),
              title: Text("My Cart".tr()),
            ),
            Divider(
              thickness: 2,
            ),

            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Help()),
                );
              },
              leading: Icon(
                Icons.help,
                color:Color(0xff69A03A),
              ),
              title: Text("Help".tr()),
            ),
            Divider(
              thickness: 2,
            ),ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              leading: Icon(
                Icons.group,
                color:Color(0xff69A03A),
              ),
              title: Text("About Us".tr()),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                _signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              leading: Icon(
                Icons.logout,
                color:Color(0xff69A03A),
              ),
              title: Text("Log Out".tr()),
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  Future<void> _getUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return; // Return early if user is not logged in
    }

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .get();
      setState(() {
        info.Name = snapshot.data()!['Name']?.toString();
        info.email = snapshot.data()!['Email']?.toString();
      });
    } catch (e) {
      // Handle any errors that may occur when fetching the user data
      print('Error getting user data: $e');
    }
  }
}