import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Login_Signup/sign_up_page.dart';
import 'package:fruit_market/validation/validations.dart';
import '../../CustomWidgets/bottom_navigation.dart';
import '../SignIn/cubit.dart';
import '../SignIn/states.dart';



class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailTxtController = TextEditingController();
  TextEditingController passwordTxtController = TextEditingController();
  TextEditingController resetEmailController = TextEditingController();

  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    emailTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }
  Future resetPassword() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email:resetEmailController.text.trim());
  }
  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Password reset'),
      content: TextField(
          controller: resetEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Enter your email')),
      actions: [
        TextButton(onPressed: (){
          resetPassword();
          final snakBar=SnackBar(content: const Text("Reset password email sent"));
        }, child: const Text("Submit"))
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => SignInCubit(),
        child: Scaffold(
          body: SafeArea(
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
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Image.asset(
                            'assets/icons/play_store_512.png',
                            width: 240,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: const Text(
                          'Fruit Market',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: emailTxtController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailLoginValidator,
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
                          controller: passwordTxtController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_showPassword,
                          validator: passwordLoginValidator,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _togglevisibility();
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Color(0xffA03A69),
                              ),
                            ),
                            hintText: 'Password'.tr(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          BlocConsumer<SignInCubit, SignInStates>(
                            builder: (context, state) {
                              if (state is SignInLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Container(
                                  width: double.infinity,
                                  height: 75,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff69A03A)),
                                        textStyle:
                                            MaterialStateProperty.all<TextStyle>(
                                                TextStyle(fontSize: 18)),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<SignInCubit>().sigInUser(
                                            email: emailTxtController.text.trim(),
                                            password: passwordTxtController.text.trim(),
                                          );
                                        }

                                      },
                                      child: Text('Sign in'.tr()),
                                    ),
                                  ),
                                );
                              }
                            },
                            listener: (context, state) {
                              //
                              if (state is SignInSuccessState) {
                                var snackBar = SnackBar(
                                  content: Text(
                                    "Welcome ${state.msgSuccess!}".tr(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigationExample()),
                                    (route) => false);
                              } else if (state is SignInErrorState) {
                                //
                                var snackBar = SnackBar(
                                  content: Text(
                                    state.msgError!.tr(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                //
                              }
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                openDialog();
                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Forgot password?         |'.tr(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => SignUp()),
                                );
                              },
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '  Create an account'.tr(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
