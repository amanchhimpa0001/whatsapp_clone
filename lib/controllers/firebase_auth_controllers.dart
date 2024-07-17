import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthController {
  final auth = FirebaseAuth.instance;

  void sendOtp(String phone) async {
    await auth.verifyPhoneNumber(
        phoneNumber: "+91" + phone,
        verificationCompleted: (v) {},
        verificationFailed: (error) {},
        codeSent: (method, otp) {
          print("==============");
          print(method);
          print(otp);
          print("==============");
        },
        codeAutoRetrievalTimeout: (method) {});
  }
}

class DatabaseController {
  final db = FirebaseDatabase.instance;

  void addData() async {
    final Map<String, dynamic> data = {"name": "Sunil", "Address": "hisar"};
    await db.ref("users").child("Aman_biodata").set(data).whenComplete(() {
      print("Data Successfully Added");
    });
  }
}
