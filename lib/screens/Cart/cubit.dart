import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Screens/Cart/states.dart';

import 'cart_model.dart';

class CartAppCubit extends Cubit<CartStates>{

  List<CartModel> getCartData=[];
  CartModel cartModel = new CartModel();

  CartAppCubit():super(CartInitState());


  // Future<void> getDD() async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   if (currentUser == null) {
  //     return; // Return early if user is not logged in
  //   }
  //
  //   try {
  //     FirebaseFirestore.instance
  //         .collection('Cart')
  //         .doc(currentUser.uid)
  //         .get().then((value){
  //       if (snapshot.exists) {
  //         for (var element in value.docs) {
  //           getCartData.add(CartModel.fromJson(element.data()));
  //           cartModel.title = snapshot.data()!['title']?.toString();
  //           cartModel.image = snapshot.data()!['price']?.toString();
  //           cartModel.price = snapshot.data()!['image']?.toString();
  //         }
  //       }
  //     });
  //
  //   } catch (e) {
  //     // Handle any errors that may occur when fetching the user data
  //     print('Error getting user data: $e');
  //   }
  //
  // }

  // void getItems(){
  //
  //   FirebaseFirestore.instance.collection("Cart").get().then((value){
  //     value.docs.forEach((element) {
  //       print(element.data());
  //       getCartData.add(CartModel.fromJson(element.data() as Map<String, dynamic>));
  //
  //
  //     });
  //   }).catchError((onError){
  //     print(onError);
  //
  //   });
  // }
  void getItems() {
    final currentUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection("Cart")
        .get()
        .then((QuerySnapshot snapshot) {

      snapshot.docs.forEach((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // Retrieve title, image, and price from the 'data' map
        String title = data['title'];
        String image = data['image'];
        String price = data['price'];

        // Create a CartModel object with the retrieved data
        CartModel cartItem = CartModel(title: title, image: image, price: price);

        getCartData.add(cartItem);
      });

      // Do something with the retrieved data
      print(getCartData);
      // ...
    }).catchError((error) {
      print(error);
    });
  }


  void GetUserCart({
    String ? title,
    String ? price,
    String ? image,
    String ? qty,
    String ? uid,
  }){
    FirebaseFirestore.instance.collection("Cart").doc(uid).set(
        {
          "title":title,
          "price":price,
          "uid":uid,
          "image":image,
        }).then((value) {
      emit(CartSuccessState(msgSuccess:title.toString()));
    }).catchError((onError){
      emit(CartErrorState(msgError: onError.toString()));
    });
  }



  Future<void> getCart() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return; // Return early if user is not logged in
    }

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(currentUser.uid)
          .get();
      if (snapshot.exists) {
        cartModel.title = snapshot.data()!['title']?.toString();
        cartModel.image = snapshot.data()!['price']?.toString();
        cartModel.price = snapshot.data()!['image']?.toString();
      }
    } catch (e) {
      // Handle any errors that may occur when fetching the user data
      print('Error getting user data: $e');
    }
  }





}

