import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation {
   String ? Name;
   String ? phone;
   String ? email;
   String ? address;
   String ? uid;
   DateTime? date;

   UserInformation({ this.Name, this.email, this.phone,this.address,this.uid});

   UserInformation.fromJson(Map<String, dynamic> json){
    Name= json['Name'];
    email= json['Email'];
    phone= json['Phone'];
    address=json['Address'];
    if (json['Date'] != null) {
      // Parse the date from the stored timestamp
      date = (json['Date'] as Timestamp).toDate();
    }
  }
   Map<String, dynamic> toJson() {
     return {
       'Name': Name,
       'Email': email,
       'Phone': phone,
       'Address': address,
       'Uid': uid,
       'Date': date != null ? Timestamp.fromDate(date!) : null,
     };
   }

   void setDate(DateTime newDate) {
     date = newDate;
   }

   DateTime? getDate() {
     return date;
   }
}
