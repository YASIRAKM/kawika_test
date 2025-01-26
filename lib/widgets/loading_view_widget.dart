import 'package:flutter/material.dart';
import 'package:kawika_machine_test/core/constants/app_colors.dart';
import 'package:kawika_machine_test/core/constants/app_typography.dart';

class LoadingViewWidget extends StatelessWidget {
  const LoadingViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          Text(
            "Loading ...",
            style: AppTypography.title,
          )
        ],
      ),
    );
  }
}
