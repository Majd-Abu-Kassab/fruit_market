import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market/Home/Model/states.dart';

import '../../Screens/Cart/cart_model.dart';
import 'home_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  List<HomeModel> OvData = [];
  List<HomeModel> OvPackData = [];
  List<HomeModel> OfData = [];
  List<HomeModel> OfPackData = [];
  List<HomeModel> DfData = [];
  List<HomeModel> DfPackData = [];
  List<HomeModel> AddtocartData = [];
  List<HomeModel> Search = [];

  HomeCubit() : super(HomeInitState());

  void getDate() {
    Search = [];
    FirebaseFirestore.instance.collection("Organic Fruits").get().then((value) {
      for (var element in value.docs) {
        OfData.add(HomeModel.fromJson(element.data(), element.id));
        Search.add(HomeModel.fromJson(element.data(), element.id));
        log(Search.toString());
      }
    });
    FirebaseFirestore.instance.collection("Fruits Pack").get().then((value) {
      for (var element in value.docs) {
        OfPackData.add(HomeModel.fromJson(element.data(), element.id));
        Search.add(HomeModel.fromJson(element.data(), element.id));
      }
      // log(OfPackData[1].price.toString());
    });
    FirebaseFirestore.instance.collection("Organic Vegs").get().then((value) {
      for (var element in value.docs) {
        OvData.add(HomeModel.fromJson(element.data(), element.id));
        Search.add(HomeModel.fromJson(element.data(), element.id));
      }
    });
    FirebaseFirestore.instance.collection("Vegs Pack").get().then((value) {
      for (var element in value.docs) {
        OvPackData.add(HomeModel.fromJson(element.data(), element.id));
        Search.add(HomeModel.fromJson(element.data(), element.id));
      }
    });

    FirebaseFirestore.instance.collection("Dry Fruits").get().then((value) {
      for (var element in value.docs) {
        DfData.add(HomeModel.fromJson(element.data(), element.id));
        Search.add(HomeModel.fromJson(element.data(), element.id));
      }
      emit(HomeSuccessState());
    });
    FirebaseFirestore.instance
        .collection("Dry Fruits Pack")
        .get()
        .then((value) {
      for (var element in value.docs) {
        DfPackData.add(HomeModel.fromJson(element.data(), element.id));
        Search.add(HomeModel.fromJson(element.data(), element.id));
      }
      emit(HomeSuccessState());
    });
  }

  List<CartModel> cartData = [];

  void AddToCart({
    String? itemId,
    String? title,
    String? price,
    String? image,
    String? qty,
  }) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      emit(HomeErrorState(msgError: 'User not logged in.'));
      return;
    }

    FirebaseFirestore.instance
        .collection("Cart")
        .doc(currentUser.uid)
        .collection("Items")
        .where("itemId", isEqualTo: itemId)
        .get()
        .then((querySnapshot) {
      print(querySnapshot.docs.toString());
      print(itemId.toString());
      if (querySnapshot.docs.isNotEmpty) {
        // Item already exists in the cart, increase the quantity by one
        final existingDoc = querySnapshot.docs.first;
        final existingQty = existingDoc.data()['qty'] ?? 0;
        existingDoc.reference.update({'qty': existingQty + 1}).then((_) {
          emit(HomeSuccessState(msgSuccess: title.toString()));
        }).catchError((onError) {
          emit(HomeErrorState(msgError: onError.toString()));
        });
      } else {
        // Item does not exist in the cart, add a new document
        FirebaseFirestore.instance
            .collection("Cart")
            .doc(currentUser.uid)
            .collection("Items")
            .add({
          "itemId": itemId,
          "title": title,
          "price": price,
          "image": image,
          "qty": 1,
        }).then((value) {
          emit(HomeSuccessState(msgSuccess: title.toString()));
        }).catchError((onError) {
          emit(HomeErrorState(msgError: onError.toString()));
        });
      }
    }).catchError((onError) {
      emit(HomeErrorState(msgError: onError.toString()));
    });
  }
  List<HomeModel> getSearchList() {
    return Search;
  }

}
