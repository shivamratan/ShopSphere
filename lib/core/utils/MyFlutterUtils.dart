
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFlutterUtils {

  static Future<void> showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );
  }

  static void showAlertDialog(
      {required BuildContext context,
      required String title,
      required String content,
      required String positiveButtonText,
      required String negativeButtonText,
      required VoidCallback? onPositiveButtonClick,
      required VoidCallback? onNegativeButtonClick,}) {

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: () {
                      print("$negativeButtonText clicked");
                      onNegativeButtonClick?.call();
                    },
                    child: Text(negativeButtonText),
                  ),
                  TextButton(
                    onPressed: () {
                      print("$positiveButtonText clicked");
                      onPositiveButtonClick?.call();
                    },
                    child: Text(positiveButtonText),
                  ),
                ],
              );
            }
        );

  }

}