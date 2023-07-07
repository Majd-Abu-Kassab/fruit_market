import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../CustomWidgets/my_orders_custom.dart';
import 'Orders/orders.dart';
import 'orderdetails.dart';
class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  List<OrderModel> orders = []; // List to store the orders

  @override
  void initState() {
    super.initState();
    fetchOrders(); // Fetch orders when the widget is initialized
  }
  Future<void> fetchOrders() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        // Return if the user is not logged in
        return;
      }

       FirebaseFirestore.instance
          .collection('orders')
          .doc(currentUser.uid)
          .collection('myOrder')
          .get().then((value){
            for(var element in value.docs){
              setState(() {
                orders.add(OrderModel.fromMap(element.data(),element.id));
                print(element.id);
                print(orders);
              });
            }
      });
      FirebaseFirestore.instance
          .collection('orders')
          .doc(currentUser.uid)
          .collection('myOrder').doc()
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
        title: Text('My Orders'),
        backgroundColor: Color(0xff69A03A),
      ),
      body: orders.isNotEmpty
          ? ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, i) {
          OrderModel order = orders[i];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderDetails(orderID: orders[i].OrdId.toString(),)));
            },
            child: Text("order ${i+1}"),
          );


        },
      )
          : Column(
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

// class MyOrdersScreen extends StatefulWidget {
//   const MyOrdersScreen({Key? key}) : super(key: key);
//
//   @override
//   _MyOrdersScreenState createState() => _MyOrdersScreenState();
// }
//
// class _MyOrdersScreenState extends State<MyOrdersScreen> {
//   List<OrderModel> orders = []; // List to store the orders
//
//   @override
//   void initState() {
//     super.initState();
//     fetchOrders(); // Fetch orders when the widget is initialized
//   }
//
//   Future<void> fetchOrders() async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         // User not logged in
//         return;
//       }
//
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('orders')
//           .where('userId',
//               isEqualTo: currentUser.uid) // Update the field name to 'userId'
//           .get();
//
//       List<OrderModel> fetchedOrders = querySnapshot.docs.map((doc) {
//         return OrderModel.fromMap(doc.data() as Map<String, dynamic>);
//       }).toList();
//
//       setState(() {
//         orders = fetchedOrders;
//       });
//     } catch (e) {
//       print('Error fetching orders: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Orders'),
//         backgroundColor: Color(0xff69A03A),
//       ),
//       body: orders.isNotEmpty
//           ? ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (context, index) {
//                 OrderModel order = orders[index];
//                 return MyOrderItem(
//                   imageUrl: order.imageUrl!,
//                   name: order.title!,
//                   totalPrice: order.Tprice!,
//                   orderState: "delivered",
//                   date:
//                       'Delivered on ${DateFormat.yMMMMd().format(order.orderDate!)}',
//                 );
//               },
//             )
//           : Column(
//               children: [
//                 Center(
//                   child: Lottie.asset('assets/images/fruit_loader.json'),
//                 ),
//                 Text(
//                   "No orders",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//     );
//   }
// }
