import 'package:flutter_firebase_login_logout_app/login_page.dart';
import 'package:flutter_firebase_login_logout_app/welcome_page.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  //We can access the AuthController anywhere in our App!
  static AuthController instance = Get.find();
  //Contains the information of the User like Email,Password!
  late Rx<User?> _user;
  //This allows you to interact with Firebase Auth using the default FirebaseApp used while installing FlutterFire on your platform!
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //Our User would be Notified!
    _user.bindStream(auth.userChanges());
    //Notifies our app that user has logged In or Out or Didn't!
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login Page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(email:user.email!));
    }
  }

  Future<void> register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account Creation Failed!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.orangeAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login Failed!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
  void logout() async{
    await auth.signOut();
  }
}
