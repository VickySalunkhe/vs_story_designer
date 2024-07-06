import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String text) {
  Fluttertoast.showToast(
      backgroundColor: Colors.black,
      gravity: ToastGravity.TOP,
      msg: text,
      toastLength: Toast.LENGTH_LONG);
}
