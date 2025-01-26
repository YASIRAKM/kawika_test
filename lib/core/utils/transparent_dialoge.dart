import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';

Future<dynamic> transparentDialoge(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );
    },
  );
}
