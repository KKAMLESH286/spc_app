import 'package:flutter/material.dart';
import 'size_config.dart';

const kWhite = Color(0xffffffff);

const kPrimaryLightColor = Color(0xffF1FDF8);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
Color kSecondaryDarkColor = Color(0xff0168b8);

const kTextColor = Colors.white;

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder());

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: BorderSide(color: kTextColor));
}

TextStyle kSaveCardDetailTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey);

TextStyle kTextFieldTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);

TextStyle kSubTitleStyle =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.normal);

TextStyle kTextFieldLabelTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey);

TextStyle kDrawerButton =
    TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400);

TextStyle kScreenSubtitleTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18);

TextStyle kheadingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(18),
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 1.5);

TextStyle kaddressStyle = TextStyle(
    fontSize: getProportionateScreenWidth(15),
    fontWeight: FontWeight.w400,
    color: Colors.white);
