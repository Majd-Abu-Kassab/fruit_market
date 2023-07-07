
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/SignUp/states.dart';



class SignUpCubit extends Cubit<SignUpStates>{

  SignUpCubit():super(SignUpInitState());
  DateTime selectTime = DateTime.now();
  void signUpUser({
    String? name,
    String? email ,
    String? phone,
    String? password,
    String? address,
    String ? date,

  })

  {

    emit(SignUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!,)
        .then((value){
          log(value.user!.uid.toString());
          saveDate(email:email, uid:value.user!.uid.toString(), name:name, phone:phone ,address:address,date: date);

    }).catchError((onError){
      //
      log(onError.toString());
      emit(SignUpErrorState());
    });


  }
  void saveDate({
    String? name,
    String? email,
    String? uid,
    String? phone,
    String? address,
    String ? date,
    String ? password,
  }){
    FirebaseFirestore.instance.collection("Users").doc(uid).set(
        {
          "Name":name,
          "Email":email,
          "uid":uid,
          "Phone":phone,
          "Address":address,
          "Date":date,
          "Password":password


        }).then((value) {
      //
      emit(SignUpSuccessState(msgSuccess: email.toString()));
    }).catchError((onError){
      emit(SignUpErrorState(msgError: onError.toString()));
    });
  } Future<void>selectDateTime(BuildContext context) async {
    //
    final DateTime ? picker = await showDatePicker(
      context: context,
      initialDate: selectTime,
      firstDate: DateTime(1950),
      lastDate: DateTime(2099),
    );

    if (picker != null ) {
      selectTime = picker;
    }

    emit(SignUpPickDateState());

  }

}