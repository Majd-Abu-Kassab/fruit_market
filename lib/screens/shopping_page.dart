import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/CustomWidgets/bottom_navigation.dart';
import 'package:fruit_market/Screens/Cart/cart_model.dart';
import 'package:fruit_market/main_home.dart';
import 'package:lottie/lottie.dart';
import '../CustomWidgets/shopping_page_custom.dart';
import 'package:fruit_market/Screens/Cart/cubit.dart';
import 'Cart/states.dart';

class CartShoppingPage extends StatefulWidget {
  CartShoppingPage(
      {Key? key,
      this.title,
      this.image,
      this.price,
      this.uid,
      this.onIncrement,
      this.onDecrement,
      this.qty})
      : super(key: key);
  final String? title;
  final String? image;
  final String? price;
  final String? uid;
  int? qty;
  final Function()? onIncrement;
  final Function()? onDecrement;

  @override
  _CartShoppingPageState createState() => _CartShoppingPageState();
}

class _CartShoppingPageState extends State<CartShoppingPage> {
  CartModel cartModel = new CartModel();
  List<CartModel> CMDate = [];

  void initState() {
    super.initState();
    fetchCartInfo();

  }

  void updateCartItemQuantity(int index, int newQuantity) {

    // Example code:
    final item = CMDate[index];
    final itemId = item
        .itemId; // Assuming you have an 'itemId' property in your 'CartModel'
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Handle error: User not logged in
      return;
    }
    log(itemId.toString());
    log(CMDate[index].itemId.toString());
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(currentUser.uid)
        .collection("Items")
        .doc(itemId.toString()).update({"qty":newQuantity})
        .then((querySnapshot) {
    }).catchError((onError) {
      // Handle error: Firestore query failed
    });
  }

  void _incrementCounter(int index) {
    setState(() {
      CMDate[index].qty = CMDate[index].qty! + 1;
      updateCartItemQuantity(
          index, CMDate[index].qty!); // Update quantity in Firebase
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      if (CMDate[index].qty! > 1) {
        CMDate[index].qty = CMDate[index].qty! - 1;
        updateCartItemQuantity(
            index, CMDate[index].qty!); // Update quantity in Firebase
      }
    });
  }
  void deleteCartItem(int index) {
    // Example code:
    final item = CMDate[index];
    final itemId = item.itemId; // Assuming you have an 'itemId' property in your 'CartModel'
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Handle error: User not logged in
      return;
    }
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(currentUser.uid)
        .collection("Items")
        .doc(itemId.toString())
        .delete()
        .then((value) {
      // Successfully deleted the item from Firestore
      // You can perform any additional actions here if needed
    })
        .catchError((error) {
      // Handle error: Firestore delete failed
    });
    setState(() {
      CMDate.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'.tr()),
          backgroundColor: Color(0xff69A03A),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height / 1.250,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:CMDate.isNotEmpty?
                  ListView.builder(
                    itemCount: CMDate.length,
                    itemBuilder: (context, index) {
                      CartModel cm = CMDate[index];
                      return Column(
                        children: [
                          ShoppingCartItem(
                            title: cm.title.toString(),
                            imageUrl: cm.image.toString(),
                            price: cm.price.toString(),
                            quantity: cm.qty!,
                            uid: widget.uid.toString(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  deleteCartItem(index);

                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 36,
                                width: 36,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _decrementCounter(index);

                                    // updateCartItemQuantity();
                                  },
                                  child: const Icon(Icons.remove),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(36, 36),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Text(
                                CMDate[index].qty.toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              SizedBox(
                                height: 36,
                                width: 36,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _incrementCounter(index);
                                  },
                                  child: const Icon(Icons.add),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(36, 36),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ), Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  ):Column(
                    children: [
                      Center(
                        child: Lottie.asset('assets/images/fruit_loader.json'),
                      ),
                      Text("Your cart is empty".tr(),style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                if (CMDate.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total".tr(),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            total(CMDate),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "JD",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 90,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                placeOrder();
                              },
                              child: Container(
                                width: 120,
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Place Order'.tr(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(Color(0xff3a6aa0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Payment option: '.tr(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Pay on delivery'.tr(),
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }




  void fetchCartInfo() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        // Return an empty list if the user is not logged in
        return;
      }

      FirebaseFirestore.instance
          .collection('Cart')
          .doc(currentUser.uid)
          .collection('Items')
          .get()
          .then((value) {
        for (var element in value.docs) {
          setState(() {
            print(element.data());
            CMDate.add(CartModel.fromJson(element.data(),element.id));
          });
        }
      });

    } catch (e) {
      print('Error fetching Info: $e');
    }
  }

  void placeOrder() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // User not logged in
      return;
    }

    try {
      // Get the cart items for the current user from the "Items" subcollection
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(currentUser.uid)
          .collection('Items')
          .get();

      WriteBatch batch = FirebaseFirestore.instance.batch();
      // cartData['userId'] = currentUser.uid; // Add the user ID
      // cartData['orderDate'] = DateTime.now(); // Add the order date

      // Add the cart item to the "orders" collection
      FirebaseFirestore.instance.collection('orders').doc(currentUser.uid).collection("myOrder").doc()
          .set({
        "data":CMDate?.map((e) => e.toJson())?.toList(),
      });
      // Move cart items to the "orders" collection
      for (QueryDocumentSnapshot cartDoc in cartSnapshot.docs) {
        // Map<String, dynamic> cartData = cartDoc.data() as Map<String, dynamic>;

        // Add additional fields to the cartData map



        // Delete the cart item from the "Cart/Items" subcollection
        batch.delete(cartDoc.reference);
      }

      // Commit the batch write operation
      await batch.commit();

      // Display a success message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Order Placed'.tr()),
            content: Text('Your order has been placed successfully.'.tr()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => BottomNavigationExample()),
                        (route) => false,
                  );

                },
                child: Text('OK'.tr()),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error placing order: $e'.tr());
      // Display an error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'.tr()),
            content: Text('An error occurred while placing your order.'.tr()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BottomNavigationExample()),
                  );
                },
                child: Text('OK'.tr()),
              ),
            ],
          );
        },
      );
    }
  }


}
String total(List<CartModel>CMDate){
  double total = 0;
  for(int i= 0;i<CMDate.length;i++){
    total=double.parse(CMDate[i].price!)*int.parse(CMDate[i].qty!.toString())+total;
  }
  return total.toStringAsFixed(2);
}


