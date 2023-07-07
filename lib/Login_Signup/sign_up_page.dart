import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/CustomWidgets/bottom_navigation.dart';
import 'package:fruit_market/Login_Signup/sign_in_page.dart';
import '../../validation/validations.dart';
import '../SignUp/cubit.dart';
import '../SignUp/states.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTxtController = TextEditingController();
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController phoneTxtController = TextEditingController();
  TextEditingController emailTxtController = TextEditingController();
  TextEditingController passwordTxtController = TextEditingController();
  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    nameTxtController.dispose();
    addressTxtController.dispose();
    phoneTxtController.dispose();
    passwordTxtController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => SignUpCubit(),
        child: Scaffold(
          body: BlocConsumer<SignUpCubit, SignUpStates>(
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SafeArea(
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 50,
                            ),
                            Stack(
                              alignment: Alignment.topLeft,
                              children: <Widget>[
                                Image.asset(
                                  'assets/icons/play_store_512.png',
                                  width: 200,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Create an account'.tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: nameTxtController,
                                keyboardType: TextInputType.name,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintText: 'Full Name'.tr(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: emailTxtController,
                                keyboardType: TextInputType.emailAddress,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintText: 'Email'.tr(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: phoneTxtController,
                                keyboardType: TextInputType.number,
                                validator: phoneValidator,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number'.tr(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: addressTxtController,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  hintText: 'Address'.tr(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<SignUpCubit>().selectDateTime(context);
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(

                                    readOnly: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),

                                        ),
                                        hintText:
                                        "Date of birth"),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: passwordTxtController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !_showPassword,
                                validator: passwordValidator,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _togglevisibility();
                                    },
                                    child: Icon(
                                      _showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xffA03A69),
                                    ),
                                  ),
                                  hintText: 'Password'.tr(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 75,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff69A03A)),
                                        textStyle: MaterialStateProperty.all<
                                            TextStyle>(TextStyle(fontSize: 18)),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<SignUpCubit>()
                                              .signUpUser(
                                                name: nameTxtController.text
                                                    .trim(),
                                                email: emailTxtController.text
                                                    .trim(),
                                                phone: phoneTxtController.text
                                                    .trim(),
                                                password: passwordTxtController
                                                    .text
                                                    .trim(),
                                            address: addressTxtController.text.trim(),
                                            date: context.read<SignUpCubit>().selectTime.toString(),

                                              );
                                        }
                                      },
                                      child: Text('Create account'.tr()),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          'Already have an account? '.tr(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => SignInPage()),
                                        );
                                      },
                                      child: Container(
                                        height: 80,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Sign in'.tr(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            listener: (context, state) {
              if (state is SignUpSuccessState) {
                //
                var snackBar = SnackBar(
                  content: Text(
                    "Welcome ${state.msgSuccess!}".tr(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationExample()),
                    (route) => false);
              } else if (state is SignUpErrorState) {
                //
                var snackBar = SnackBar(
                  content: Text(
                    state.msgError!.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                //
              }
            },
          ),
        ),
      ),
    );
    ;
  }
}
