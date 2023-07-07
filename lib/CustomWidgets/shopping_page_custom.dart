import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/Cart/cart_model.dart';

class ShoppingCartItem extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String price;
  final int quantity;
  final String uid;


  const ShoppingCartItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.uid,
  }) : super(key: key);

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  CartModel cartModel = new CartModel();

  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              widget.imageUrl,
              height: 200.0,
              width: 90.0,
              fit: BoxFit.fill,
            ),
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.price,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'JD',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // onTap: () {
          //
          // },
        ),
        const SizedBox(height: 8.0),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SizedBox(
        //       height: 36,
        //       width: 36,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // decreaseQuantity();
        //           // updateCartItemQuantity();
        //
        //         },
        //         child: const Icon(Icons.remove),
        //         style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           minimumSize: const Size(36, 36),
        //           padding: EdgeInsets.zero,
        //         ),
        //       ),
        //     ),
        //     const SizedBox(width: 15.0),
        //     Text(
        //       widget.quantity.toString(),
        //       style: const TextStyle(
        //         fontSize: 20.0,
        //       ),
        //     ),
        //     const SizedBox(width: 8.0),
        //     SizedBox(
        //       height: 36,
        //       width: 36,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // increaseQuantity();
        //           // updateCartItemQuantity();
        //         },
        //         child: const Icon(Icons.add),
        //         style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           minimumSize: const Size(36, 36),
        //           padding: EdgeInsets.zero,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),


      ],
    );
  }


}

