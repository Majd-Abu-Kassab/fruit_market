import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? OrdId;
  String? imageUrl;
  DateTime? orderDate;
  String? Tprice;
  int? quantity;
  String? title;
  String? uid;
  String? userId;
  List<OrderModel>? items;

  OrderModel({
    this.OrdId,
    this.imageUrl,
    this.orderDate,
    this.Tprice,
    this.quantity,
    this.title,
    // this.uid,
    this.userId,
    this.items ,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json, String id) {
    return OrderModel(
      OrdId: id,
      imageUrl: json['image'],
      orderDate: json['orderDate'] != null ? (json['orderDate'] as Timestamp).toDate() : null,
      Tprice: json['price'],
      quantity: json['qty'],
      title: json['title'],
      // uid: json['uid'],
      userId: json['userId'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'image': imageUrl,
      'orderDate': orderDate,
      'price': Tprice,
      'qty': quantity,
      'title': title,
      // 'uid': uid,
      'userId': userId,
    };
  }
}