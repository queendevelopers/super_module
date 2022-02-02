import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required String title,
    required String message,
    required VoidCallback okBtnHandler}) {
  final textStyle = TextStyle(
      color: Color(0xFF5A669D), fontSize: 16, fontWeight: FontWeight.w600);
  // set up the button
  Widget okButton =
      TextButton(child: Text('Ok', style: textStyle), onPressed: okBtnHandler
          //     () {
          //   Navigator.of(context).pop();
          //   if (isDoublePop) {
          //     Navigator.of(context).pop();
          //   }
          // },
          );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Column(children: <Widget>[
      Text(title, style: textStyle.copyWith(fontSize: 18.0)),
      const Divider(
        thickness: 1.0,
      )
    ]),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
