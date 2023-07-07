import 'package:cloud_firestore/cloud_firestore.dart';

class AboutModel {
  String? description;
  String? descriptionAR;
  String? email;
  String? location;
  String? locationAR;
  String? phone;

  AboutModel({this.email, this.location, this.description, this.phone, this.locationAR, this.descriptionAR});

  factory AboutModel.fromMap(Map<String, dynamic> map) {
    return AboutModel(
      email: map['email'],
      location: map['location'],
      description: map['Description'],
      locationAR: map['locationAr'],
      descriptionAR: map['DescriptionAr'],
      phone: map['Phone Number'],
    );
  }


}

  // Future<List<AboutModel>> fetchProducts() async {
  //   List<AboutModel> about = [];
  //
  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('products').get();
  //
  //     querySnapshot.docs.forEach((doc) {
  //       AboutModel aboutModel = AboutModel.fromMap(doc.data() as Map<String, dynamic>);
  //       about.add(aboutModel);
  //     });
  //   } catch (e) {
  //     print('Error fetching products: $e');
  //   }
  //
  //   return about;
  // }
