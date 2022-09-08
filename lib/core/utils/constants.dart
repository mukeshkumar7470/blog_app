import 'dart:ui';

import 'package:blog_app/core/utils/size_config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.060,
  fontWeight: FontWeight.bold,
);

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.030,
);

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
    Size size,
    ) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurpleAccent,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Poppins-Regular',
);

const kGeneralTextStyle =  TextStyle(color: kTextColor, fontFamily: 'Poppins-SemiBold', fontSize: 20.0);

const kPrimaryColor = Color(0xFFF7941D);
const kPrimaryLightColor = Color(0xFFFEEFDD);

const kSecondaryColor = Color(0xFF979797);

const kTextColor = Color(0xFF085187);

const kCompleted_job_card_color = Color(0xFFCDF9C2);

const kHappy_client_card_color = Color(0xFFFC99A4);

const kProsals_card_color = Color(0xFF90CAF9);

const kJob_invitation_card_color = Color(0xFFD3D3FC);

final kLabelStyle = TextStyle(
  color: Color(0xff085187),
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins-Regular',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xff085187),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Color(0xff085187),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins-Regular',
  color: Color(0xff085187),
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email!";
const String kInvalidEmailError = "Please Enter Valid Email!";
const String kInvalidAddressError = "Please Enter Valid Address!";
const String kPassNullError = "Please Enter your password!";
const String kShortPassError = "Password must be at least 8 characters long!";
const String kMatchPassError = "Passwords don't match!";
const String kNamelNullError = "Please Enter your name!";
const String kPhoneNumberNullError = "Please Enter your phone number!";
const String kInvalidPhoneNumber = "Please enter a valid phone number!";
const String kAddressNullError = "Please Enter your address!";
const String kRadioButtonNullError = "Please select a roll!";
const String kTandCAgreeError = "Please read & agree terms and conditions";
const String kCloseJobWarning = "Are you sure you want to cancel this job?";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const urlBase = 'https://reqres.in/api/';
const urlLogin = 'login';
const urlUserList = 'users?page=1';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

class ApiEndpoints {
  static const String baseURL = 'https://xyz';
}
