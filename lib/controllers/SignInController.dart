import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/routes/app_routes.dart';

class SignInController extends GetxController {
  final TextEditingController emailEditController = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController passwordEditController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  RxBool isObscure = true.obs;
  RxString userName = "User".obs;

  isObscureActive() {
    isObscure.value = !isObscure.value;
  }

  void apiLogin() async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: true);
    Get.offAllNamed(AppRoutes.bottomNavbar);
  }

  loginWithGoogle() async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);
      final User? currentUser = _auth.currentUser;
      Get.offAllNamed(AppRoutes.bottomNavbar); // navigate to your wanted page
      debugPrint('User Data:::: $currentUser');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("LOGGED_IN", true);
      prefs.setString("USER_NAME", googleSignInAccount.displayName!);

      return;
    } catch (e) {
      Get.back();
      Get.snackbar('Error', "Can't sign in with google at this moment.",
          backgroundColor: Colors.red);
      rethrow;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword() async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      final _credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditController.text,
        password: passwordEditController.text,
      );

      await _credential.user!.updateDisplayName(username.text);
      Get.offAllNamed(AppRoutes.bottomNavbar); // navigate to your wanted page
      debugPrint('User Data:::: $_credential');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("LOGGED_IN", true);
      prefs.setString("USER_NAME", _credential.user!.displayName!);
      return _credential;
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint('User Data::::1' + e.code);

      /// These are two examples of several possible error messages from
      /// FirebaseAuth. Find the [complete list of error messages here.](https://firebase.google.com/docs/auth/admin/errors)
      if (e.code == 'invalid-email') {
        Get.snackbar('Error', "invalid-email.", backgroundColor: Colors.red);
      } else if (e.code == 'weak-password') {
        Get.snackbar('Error', "weak-password", backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', "Email Already Exist, Please login.",
            backgroundColor: Colors.red);
      } else {
        Get.snackbar('Error', "Something went wrong.",
            backgroundColor: Colors.red);
      }
      return null;
    }
  }

  Future<UserCredential?> loginWithEmailAndPassword() async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEditController.text,
        password: passwordEditController.text,
      );
      Get.offAllNamed(AppRoutes.bottomNavbar); // navigate to your wanted page
      debugPrint('User Data::::1111 $credential');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("LOGGED_IN", true);
      prefs.setString("USER_NAME", credential.user!.displayName!);
      return credential;
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint('Error ' + e.code);
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', "Email doesn\'t exist, Please sign up instead.",
            backgroundColor: Colors.red);
      }

      /// These are two examples of several possible error messages from
      /// FirebaseAuth. Find the [complete list of error messages here.](https://firebase.google.com/docs/auth/admin/errors)
      if (e.code == 'email-doesnt-exist') {
        Get.snackbar('Error', "Email doesn\'t exist, Please sign up instead.",
            backgroundColor: Colors.red);
      }
      if (e.code == 'wrong-password') {
        Get.snackbar('Error', "Password not matched.",
            backgroundColor: Colors.red);
      }
      return null;
    }
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('LOGGED_IN');
    prefs.remove('USER_NAME');

    Get.offAllNamed(
        AppRoutes.signIn); // navigate to your wanted page after logout.
  }
}
