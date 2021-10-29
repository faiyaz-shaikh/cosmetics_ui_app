import 'package:cosmetic_ui_app/controller/otp_controller.dart';
import 'package:cosmetic_ui_app/controller/sign_in_controller.dart';
import 'package:cosmetic_ui_app/ui/sceeen/main_screen.dart';
import 'package:cosmetic_ui_app/ui/widget/google_sign_in_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
    Get.put(
      SignInController(),
    );
    Get.put(
      OTPController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainPage();
        }
        return GoogleSignInWidget();
      },
    );
  }
}
