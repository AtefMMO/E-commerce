import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xff004182),
            content: Row(
              children: [
                CircularProgressIndicator(backgroundColor: Color(0xff004182)),
                Text('  $message'),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String? title,
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool barrierDismissible = true}) {
    List<Widget> action = [];
    if (posActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      action.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xff004182),
            content: Text('  $message'),
            title:
            Text(title ?? "title", style: TextStyle(color: Colors.white)),
            actions: action,
          );
        });
  }
}