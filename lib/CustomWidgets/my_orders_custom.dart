import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrderItem extends StatelessWidget {
  final String imageUrl;
  final String oID;
  final String name;
  final String date;
  final String totalPrice;
  final String orderState;
  final String qtyNumber;
  final IconData? trailingIcon;

  const MyOrderItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.date,
    this.trailingIcon,
    required this.totalPrice,
    required this.orderState,
    required this.qtyNumber,
    required this.oID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Square image with rounded corners on the left
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          // Product name, rating, and "Rate this product" text on the right
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  oID,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  date,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      totalPrice,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      "JD",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width:15.0),
                    Text(
                      orderState,
                      style: TextStyle(color: Colors.green),
                    ),SizedBox(width:15.0),
                    Text(
                      qtyNumber,
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Trailing icon on the top right
          //   Padding(
          //     padding: const EdgeInsets.all(14.0),
          //     child: Icon(
          //       Icons.delete,
          //       color: Colors.red,
          //       size: 24.0,
          //     ),
          //   ),

        ],
      ),
    );
  }
}
