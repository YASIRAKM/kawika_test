import 'package:flutter/material.dart';

import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';
import 'package:kawika_machine_test/widgets/custom_button.dart';

Future<dynamic> confirmDialoge(
    {required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onPressed}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 1,
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
              color: AppColors.secondryColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Text(
                title,
                style: AppTypography.title,
              ),
              Text(
                content,
                style: AppTypography.subTitle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      isCancelButton: true,
                      width: 120,
                      height: 40,
                      onPressed: () {},
                      buttonTitle: "Cancel"),
                  CustomButton(
                      height: 40,
                      width: 120,
                      onPressed: onPressed,
                      buttonTitle: "Logout"),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
