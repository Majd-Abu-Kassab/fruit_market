import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Home/Model/cubit.dart';

import 'package:fruit_market/screens/products.dart';

import '../Home/Model/states.dart';
import 'Search/search_class.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  TextEditingController searchController = TextEditingController();

  String qu = "";

  @override
  Widget build(BuildContext context) {
    String searchControllerValue = searchController.text;
    return BlocProvider(
      create: (contex) => HomeCubit()..getDate(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: BlocConsumer<HomeCubit, HomeStates>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          Container(
                            height: 130,
                            color: Color(0xFF69A03A),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Fruit Market",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // IconButton(
                                      //   icon: Icon(
                                      //     Icons.search,
                                      //     color: Colors.white,
                                      //   ),
                                      //   onPressed: () {
                                      //     showSearch(
                                      //         context: context,
                                      //
                                      //         // delegate to customize the search bar
                                      //         delegate: CustomSearchDelegate(context.read<HomeCubit>().Search));
                                      //   },
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            bottom: 10,
                            top: 80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: TextButton(
                                          onPressed: () {
                                            showSearch(
                                                context: context,

                                                // delegate to customize the search bar
                                                delegate: CustomSearchDelegate(context.read<HomeCubit>().Search));
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Search".tr(),
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                              EdgeInsets.zero,
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TabBar(
                          isScrollable: true,
                          indicator: BoxDecoration(
                            color: Color(0xff3a6aa0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(
                              text: "Vegetables".tr(),
                            ),
                            Tab(
                              text: "Fruits".tr(),
                            ),
                            Tab(
                              text: "Dry Fruits".tr(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: TabBarView(
                          children: [
                            Vegs(),
                            Fruits(),
                            DryF(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {},
            ),
          ),
        ),
      ),
    );
  }
}
// class SendingScreen extends StatelessWidget {
//   final TextEditingController textFieldController = TextEditingController();
//
//   void onSubmit(String textFieldValue) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ReceivingScreen(textFieldValue: textFieldValue),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sending Screen'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: textFieldController,
//             decoration: InputDecoration(
//               hintText: 'Enter some text',
//             ),
//             onSubmitted: onSubmit,
//           ),
//         ],
//       ),
//     );
//   }
// }
