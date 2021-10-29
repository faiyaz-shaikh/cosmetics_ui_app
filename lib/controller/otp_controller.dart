import 'package:cosmetic_ui_app/ui/sceeen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  String verificationCode='';

  Future<void> verifyOTP(String phone, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                  (route) => false);
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print('failed');
      },
      codeSent: (String verificationID, int? resendToken) {
        verificationCode = verificationID;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationCode = verificationID;
        update();
      },
      timeout: Duration(seconds: 120),
    );
    update();
  }
}
