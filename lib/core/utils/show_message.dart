import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/main.dart';

showMessage({required String message}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    backgroundColor: AppColors.primaryColor.withAlpha((.3 * 255).toInt()),
    content: Row(
      spacing: 12,
      children: [Icon(Icons.info), Expanded(child: Text(message))],
    ),
  );
  return sccaffoldMessenagKey.currentState!.showSnackBar(snackBar);
}
