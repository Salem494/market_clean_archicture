
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:core';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backwardsCompatibility: false,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black, statusBarBrightness: Brightness.dark),
      color: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 50.0,
      ),
    ));

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: const AppBarTheme(
        backwardsCompatibility: false,
        backgroundColor: Color(0xFF333739),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black, statusBarBrightness: Brightness.dark),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        )));

// ignore: non_constant_identifier_names
NavigateAndRemove({ BuildContext context,  Widget widget}) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);

NavigateTo({ BuildContext context,  Widget widget}) =>
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

TextStyle textStyle({ Color color,  double fontSize}) {
  return TextStyle(
      fontWeight: FontWeight.bold, color: color, fontSize: fontSize);
}

Widget customButton({
   String title,
   VoidCallback onPressed,
   Color color,
   double height,
   double width,
  double fontSize = 15.0,
}) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height,
          width: width,
          color: color,
          child: Center(
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    ),
  );
}

TextFormField textFormField({
   Color color,
   Color fillColor,
   String hintText,
   IconData icon,
  FormFieldValidator<String> onChanged,
   TextEditingController controller,
   FormFieldValidator<String> validate,
  TextInputType textInputType = TextInputType.text
}) =>TextFormField(
  onChanged:onChanged,
  textInputAction: TextInputAction.next,
  cursorColor: color,
  controller: controller,
  validator: validate,
  keyboardType: textInputType,
  decoration: InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor:fillColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25)
    ),
    prefixIcon: Padding(
      padding: const EdgeInsets.all(2),
      child: Icon(icon),
    ),
  ),
);



void showToast({
   String text,
   ToastColors color,
}) {
   Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: setToastColor(color),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastColors {
  SUCCESS,
  ERROR,
  WARNING,
}

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.ERROR:
      c = Colors.red;
      break;
    case ToastColors.SUCCESS:
      c = Colors.green;
      break;
    case ToastColors.WARNING:
      c = Colors.amber;
      break;
  }

  return c;
}


String Token = '';
