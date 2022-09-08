import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/constants.dart';
import '../core/utils/size_config.dart';
import '../services/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPageIntro);
  }

  @override
  void initState() {
    super.initState();

    checkInternetConnection().then((internet) {
      if (internet) {
        // Internet Present Case
        startTime();
      } else {
        // No-Internet Case
        showAlertDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Lottie.asset(
            'assets/lotti/splash_bg.json',
            height: size.height,
            width: size.width,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: const Text("Retry"),
      onPressed: () {
        Navigator.pop(context);
        checkInternetConnection().then((internet) {
          if (internet) {
            // Internet Present Case
            startTime();
          } else {
            // No-Internet Case
            showAlertDialog(context);
          }
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      elevation: 2,
      title: const Text("No Internet connection!"),
      content: const Text("Please Connect your device to internet first"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void navigationPageIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("LOGGED_IN") && prefs.getBool("LOGGED_IN") == true) {
      Get.offNamed(AppRoutes.bottomNavbar);
    } else {
      Get.offNamed(AppRoutes.signIn);
    }
  }
}
