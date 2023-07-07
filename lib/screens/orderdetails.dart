import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../CustomWidgets/my_orders_custom.dart';
import 'Orders/orders.dart';

class OrderDetails extends StatefulWidget {
  final  String orderID;
  const OrderDetails({Key? key, required this.orderID}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}


class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    super.initState();
    fetchOrders(); // Fetch orders when the widget is initialized
  }

  List<OrderModel> orders = [];

  Future<void> fetchOrders() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        // Return if the user is not logged in
        return;
      }

      // FirebaseFirestore.instance
      //     .collection('orders')
      //     .doc(currentUser.uid)
      //     .collection('myOrder')
      //     .get().then((value){
      //   for(var element in value.docs){
      //     setState(() {
      //       orders.add(OrderModel.fromMap(element.data(),element.id));
      //       print(element.id);
      //       print(orders);
      //     });
      //   }
      // });
      FirebaseFirestore.instance
          .collection('orders')
          .doc(currentUser.uid)
          .collection('myOrder').doc(widget.orderID)
          .get().then((value){
        print(value["data"][0]["title"]);
        for(var element in value["data"]){
          setState(() {
            orders.add(OrderModel.fromMap(element,""));
            print(element);

            print(orders[0].title);
          });
        }
      });

    } catch (e) {
      print('Error fetching orders: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Order details'),
    backgroundColor: Color(0xff69A03A),
    ),
    body:orders.isNotEmpty
        ? ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, i) {
        OrderModel order = orders[i];
        return MyOrderItem(
          oID: order.OrdId.toString(),
          imageUrl: order.imageUrl.toString(),
          name: order.title.toString(),
          totalPrice: order.Tprice.toString(),
          orderState: "delivered",
          qtyNumber: order.quantity.toString(),
          date: 'delivered on${DateFormat.yMMMd().format(order.orderDate!)}',
        );
      },
    ):Column(
      children: [
        Center(
          child: Lottie.asset('assets/images/fruit_loader.json'),
        ),
        Text(
          "No orders",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    ),
    );
  }
}
