import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Screens/AboutUS/model_about_us.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  List<AboutModel> about = [];

  Future<List<AboutModel>> fetchInfo() async {

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('About Us').get();

      querySnapshot.docs.forEach((doc) {
        AboutModel aboutModel = AboutModel.fromMap(doc.data() as Map<String, dynamic>);
        about.add(aboutModel);
      });
    } catch (e) {
      print('Error fetching Info: $e');
    }

    return about;
  }

  Future<void> fetchData() async {
    List<AboutModel> fetchedAboutus = await fetchInfo();
    setState(() {
      about = fetchedAboutus;
    });
  }

  void initState() {
    super.initState();
    fetchData();
    // fetchDataFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff69A03A),
        title: Text("About US".tr()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder<List<AboutModel>>(
              future: fetchInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset('assets/images/fruit_loader.json'),
                  );
                }  else {
                  List<AboutModel> aboutData = snapshot.data ?? [];

                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      AboutModel aboutModel = aboutData[index];

                      return Column(
                        children: [
                          Text(
                            aboutModel.description.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Divider(
                            thickness: 2,
                          ),
                          Text(
                            aboutModel.location.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse('mailto:${aboutModel.email}'));
                            },
                            child: Text(
                              aboutModel.email.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse('tel:${aboutModel.phone}'));
                            },
                            child: Text(
                              aboutModel.phone.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );

  }
}
// Future<void> fetchDataFromFirebase() async {
//   try {
//     final snapshot = await FirebaseFirestore.instance
//         .collectionGroup('Cart')
//         .get();
//
//     if (snapshot.docs.isNotEmpty) {
//       for (var doc in snapshot.docs) {
//         final data = doc.data();
//         if (data != null) {
//           // Retrieve and use the data from each document
//           final description = data['Description']?.toString();
//           final email = data['email']?.toString();
//           final location = data['location']?.toString();
//           final phoneNumber = data['Phone Number']?.toString();
//
//           print(' Description: $description');
//           print(' Email: $email');
//           print(' Location: $location');
//           print(' Phone Number: $phoneNumber');
//         }
//       }
//     } else {
//       print('No documents found');
//     }
//   } catch (e) {
//     // Handle any errors that may occur when fetching the data
//     print('Error retrieving data: $e');
//   }
// }
// child: Column(
//   children: [
//     Text(
//       aboutModel.description.toString(),
//       style: TextStyle(fontSize: 19),
//     ),
//     Text(
//       aboutModel.location.toString(),
//       style: TextStyle(fontSize: 19),
//     ),
//     Text(
//       aboutModel.email.toString(),
//       style: TextStyle(fontSize: 19),
//     ),
//     Text(
//       aboutModel.phone.toString(),
//       style: TextStyle(fontSize: 19),
//     ),
//   ],