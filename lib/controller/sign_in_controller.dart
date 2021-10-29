import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var facebookLogin = FacebookLogin();
  FacebookLoginResult? facebookLoginResult;

  Future<void> signInWithGoogle() async {
    googleAccount.value = await _googleSignIn.signIn();

    final googleAuth = await googleAccount.value!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithFacebook() async {
    facebookLoginResult = await facebookLogin.logIn(['email']);
    FacebookAccessToken facebookAccessToken = facebookLoginResult!.accessToken;

    final credential =
        FacebookAuthProvider.credential(facebookAccessToken.token);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
