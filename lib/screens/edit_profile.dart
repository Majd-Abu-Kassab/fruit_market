import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../UserInfo/states.dart';
import '../Validation/validations.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserInformation EditInfo = new UserInformation();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTxtController = TextEditingController();
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController phoneTxtController = TextEditingController();
  TextEditingController emailTxtController = TextEditingController();
  TextEditingController dateTxtController = TextEditingController();

  bool isLoading = false;


  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  void dispose() {
    nameTxtController.dispose();
    addressTxtController.dispose();
    phoneTxtController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameTxtController.text=EditInfo.Name.toString();
    addressTxtController.text=EditInfo.address.toString();
    phoneTxtController.text=EditInfo.phone.toString();
    emailTxtController.text=EditInfo.email.toString();
    dateTxtController.text=EditInfo.date.toString();

    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
              body: ListView(
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
                          child:  Text(
                            'Profile'.tr(),
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
                              hintText: EditInfo.Name.toString(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: () {
                              _selectDate();
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                readOnly: false,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),

                                    ),
                                    hintText:
                                    EditInfo.date.toString()),
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
                              hintText: EditInfo.email.toString(),
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
                              hintText: EditInfo.phone.toString(),
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
                              hintText: EditInfo.address.toString(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
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
                                    _saveUserData();

                                  },
                                  child: isLoading?CircularProgressIndicator(): Text('Save'.tr()),
                                ),
                              ),
                            ),

                          ],
                        ),


                      ],
                    ),



                  ),
                ],
              ),


        ),
      ),
    );
  }

  Future<void> _getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return; // Return early if user is not logged in
    }

    try {
      setState(() {
        isLoading = true; // Set isLoading to true to show CircularProgressIndicator
      });

      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .get();
      final data = snapshot.data();
      if (data != null) {
        setState(() {
          EditInfo.Name = data['Name']?.toString();
          EditInfo.email = data['Email']?.toString();
          EditInfo.phone = data['Phone']?.toString();
          EditInfo.address = data['Address']?.toString();

          // Update the type casting for the 'Date' field
          final dateValue = data['Date'];
          if (dateValue is Timestamp) {
            EditInfo.date = dateValue.toDate();
          } else if (dateValue is String) {
            EditInfo.date = DateTime.tryParse(dateValue);
          }

          dateTxtController.text = EditInfo.date != null
              ? EditInfo.date!.toString()
              : 'Change date of birth';
        });
      }

      setState(() {
        isLoading = false; // Set isLoading back to false after data fetching is completed
      });
    } catch (e) {
      // Handle any errors that may occur when fetching the user data
      print('Error getting user data: $e');
      setState(() {
        isLoading = false; // Set isLoading back to false in case of an error
      });
    }
  }



  Future<void> _saveUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return; // Return early if user is not logged in
    }

    try {
      await FirebaseFirestore.instance.collection('Users').doc(currentUser.uid).update({
        'Name': nameTxtController.text.trim(),
        'Email': emailTxtController.text.trim(),
        'Phone': phoneTxtController.text.trim(),
        'Address': addressTxtController.text.trim(),
        'Date': EditInfo.getDate(),
      });
      setState(() {
        EditInfo.Name = nameTxtController.text.trim();
        EditInfo.email = emailTxtController.text.trim();
        EditInfo.phone = phoneTxtController.text.trim();
        EditInfo.address = addressTxtController.text.trim();
        EditInfo.date = DateTime.parse(dateTxtController.text);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('New Profile saved successfully!')),
      );
    } catch (e) {
      // Handle any errors that may occur when updating the user data
      print('Error updating profile info: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save new profile info. Please try again later.')),
      );
    }
  }
  Future<void> _selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: EditInfo.date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        EditInfo.date = selectedDate;
        dateTxtController.text = selectedDate.toString();
      });
    }
  }

}
