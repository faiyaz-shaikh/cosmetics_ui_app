import 'package:cosmetic_ui_app/controller/sign_in_controller.dart';
import 'package:cosmetic_ui_app/ui/sceeen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSignInWidget extends StatelessWidget {
  final SignInController _signInController = Get.find<SignInController>();

  void onGoogleButtonClick(BuildContext context) async {
    await _signInController.signInWithGoogle();
    if (_signInController.googleAccount.value != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }
  }

  void onFacebookButtonClick(BuildContext context) async {
    await _signInController.signInWithFacebook();
    if (_signInController.facebookLoginResult != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              onPressed: () async => onGoogleButtonClick(context),
              label: Text('Sign in with google'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              heroTag: 'tag1',
            ),
            SizedBox(height: 10,),
            FloatingActionButton.extended(
              onPressed: ()async => onFacebookButtonClick(context),
              label: Text('Sign in with facebook'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              heroTag: 'tag2',
            ),
          ],
        ),
      ),
    );
  }
}
