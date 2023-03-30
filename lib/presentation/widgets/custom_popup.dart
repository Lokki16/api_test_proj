import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSimpleDialog({
  String title = '',
  bool barrierDismissible = true,
  double titleTopPadding = 10,
  double titleBottomPadding = 10,
  double titleHorizontalPadding = 15,
  double borderRadius = 16,
}) {
  Future<bool> onWillPop() {
    if (barrierDismissible) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  return showDialog(
    context: Get.context!,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return WillPopScope(
        onWillPop: onWillPop,
        child: SimpleDialog(
          title: Text(title, textAlign: TextAlign.center),
          titlePadding: EdgeInsets.only(
            top: titleTopPadding,
            bottom: titleBottomPadding,
            left: titleHorizontalPadding,
            right: titleHorizontalPadding,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
      );
    },
  );
}
