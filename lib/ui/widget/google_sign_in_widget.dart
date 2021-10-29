import 'package:cosmetic_ui_app/controller/sign_in_controller.dart';
import 'package:cosmetic_ui_app/ui/sceeen/main_screen.dart';
import 'package:cosmetic_ui_app/ui/sceeen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSignInWidget extends StatelessWidget {
  final SignInController _signInController = Get.find<SignInController>();

  final TextEditingController _controller = TextEditingController();

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
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OTPScreen(_controller.text),
                  ),
                );
              },
              label: Text('Connect in with phone'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              heroTag: 'tag3',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FloatingActionButton.extended(
                onPressed: () async => onGoogleButtonClick(context),
                label: Text('Sign in with google'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                heroTag: 'tag1',
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async => onFacebookButtonClick(context),
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
