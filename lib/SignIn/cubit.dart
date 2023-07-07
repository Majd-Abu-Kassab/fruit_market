


import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_market/SignIn/states.dart';


import 'package:shared_preferences/shared_preferences.dart';


class SignInCubit extends Cubit <SignInStates>{

  SignInCubit ():super(SignInInitState());

  Future<void> sigInUser({String ? email , String ? password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(SignInLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    ).then((value) {

      prefs.setString("id",value.user!.uid.toString());
      log(value.user!.email.toString());
      emit(SignInSuccessState(msgSuccess:  value.user!.email.toString()));
    }).catchError((onError){
      //
      log(onError.toString());
      emit(SignInErrorState(msgError: onError.toString()));
    });
  }

}