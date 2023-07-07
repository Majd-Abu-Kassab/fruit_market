import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../Screens/shopping_page.dart';
import '../screens/fruits_page.dart';
import '../screens/my_account.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  List _pages = [
    Center(
      child: TabBarDemo(),
    ),
    Center(
      child: CartShoppingPage(),
    ),
    // Center(
    //   child: FavPage(),
    // ),
    Center(
      child: MyAccScreen(),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Color(0xff769E49),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home".tr()),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Shopping Cart".tr()),
          // BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: "My Account".tr()),
        ],
      ),
    );
  }
}