import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/main.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;
  final Color bgColor;
  final double width;
  final double height;
  final TextStyle titleStyle;
  final bool isCancelButton;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.bgColor = AppColors.buttonColor,
    this.width = double.maxFinite,
    this.height = 45,
    this.titleStyle = const TextStyle(color: AppColors.buttonTextColor),
    this.isCancelButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
            side: isCancelButton
                ? BorderSide(color: AppColors.primaryColor)
                : null,
            backgroundColor: isCancelButton ? AppColors.secondryColor : bgColor,
            fixedSize: Size(width, height)),
        onPressed: isCancelButton
            ? () {
                navigatorKey.currentState!.pop();
              }
            : onPressed,
        child: Text(
          buttonTitle,
          style: isCancelButton
              ? titleStyle.copyWith(color: AppColors.primaryColor)
              : titleStyle,
        ));
  }
}
